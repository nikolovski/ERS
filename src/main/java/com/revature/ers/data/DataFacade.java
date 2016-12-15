package com.revature.ers.data;

import com.revature.ers.ServiceLocator;
import com.revature.ers.beans.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Martino Nikolovski on 12/8/16.
 */
public class DataFacade {
    private Connection connection;

    public List<Reimbursement> insertReimbursement(Reimbursement reimbursement) {
        List<Reimbursement> reimbursementList = null;
        try {
            connection = ServiceLocator.getERSDatabase().getConnection();
            connection.setAutoCommit(false);
            ReimbursementDAO reimbursementDAO = new ReimbursementDAO(connection);
            reimbursementDAO.insert(reimbursement);
            connection.commit();
            reimbursementList = reimbursementDAO.queryByUser(reimbursement.getReimbAuthor(),1);
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                return reimbursementList;
            }
        }
    }

    public List<Reimbursement> getAllReimbursements() {
        List<Reimbursement> list = null;
        try {
            connection = ServiceLocator.getERSDatabase().getConnection();
            list = new ReimbursementDAO(connection).queryAll();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                return list;
            }
        }
    }

    public List<Reimbursement> getAllReimbursementsFromAuthor(User author) {
        List<Reimbursement> list = null;
        try {
            connection = ServiceLocator.getERSDatabase().getConnection();
            list = new ReimbursementDAO(connection).queryByUser(author, 1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                return list;
            }
        }
    }

    public List<Reimbursement> getAllReimbursementsFromResolver(User resolver) {
        List<Reimbursement> list = null;
        try {
            connection = ServiceLocator.getERSDatabase().getConnection();
            list = new ReimbursementDAO(connection).queryByUser(resolver, 2);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                return list;
            }
        }
    }

    public Reimbursement getReimbursementById(int id) {
        Reimbursement reimbursement = null;
        try {
            connection = ServiceLocator.getERSDatabase().getConnection();
            reimbursement = new ReimbursementDAO(connection).queryById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                return reimbursement;
            }
        }
    }

    public void approveReimbursement(Reimbursement reimbursement) {
        try {
            connection = ServiceLocator.getERSDatabase().getConnection();
            new ReimbursementDAO(connection).approve(reimbursement, true);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void declineReimbursement(Reimbursement reimbursement) {
        try {
            connection = ServiceLocator.getERSDatabase().getConnection();
            new ReimbursementDAO(connection).approve(reimbursement, false);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public List<Reimbursement> getAllPendingReimbursements() {
        List<Reimbursement> list = null;
        try {
            connection = ServiceLocator.getERSDatabase().getConnection();
            list = new ReimbursementDAO(connection).queryPending();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                return list;
            }
        }
    }

    public void insertUser(User user) {
        try {
            connection = ServiceLocator.getERSDatabase().getConnection();
            new UserDAO(connection).insert(user);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public List<User> getAllUsers() {
        List<User> list = null;
        try {
            connection = ServiceLocator.getERSDatabase().getConnection();
            list = new UserDAO(connection).queryAll();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                return list;
            }
        }
    }

    public User getUserByUsername(String username) {
        User user = null;
        try {
            connection = ServiceLocator.getERSDatabase().getConnection();
            user = new UserDAO(connection).queryByUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                return user;
            }
        }
    }

    public User getUserByEmail(String email) {
        User user = null;
        try {
            connection = ServiceLocator.getERSDatabase().getConnection();
            user = new UserDAO(connection).queryByEmail(email);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                return user;
            }
        }
    }

    public List<UserRole> getAllRoles() {
        List<UserRole> userRoles = null;
        try {
            connection = ServiceLocator.getERSDatabase().getConnection();
            userRoles = new UserRoleDAO(connection).queryAll();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                return userRoles;
            }
        }
    }

    public UserRole getRole(int id) {
        UserRole role = null;
        try {
            connection = ServiceLocator.getERSDatabase().getConnection();
            role = new UserRoleDAO(connection).queryById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                return role;
            }
        }
    }


    public List<Reimbursement> getAllApprovedReimbursements(User user) {
        List<Reimbursement> reimbursements = null;
        try {
            connection = ServiceLocator.getERSDatabase().getConnection();
            reimbursements = new ReimbursementDAO(connection).queryAccepted(user);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                return reimbursements;
            }
        }

    }

    public List<Reimbursement> getAllDeclinedReimbursements(User user) {
        List<Reimbursement> reimbursements = null;
        try {
            connection = ServiceLocator.getERSDatabase().getConnection();
            reimbursements = new ReimbursementDAO(connection).queryDeclined(user);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                return reimbursements;
            }
        }
    }

    public List<Reimbursement> updateBulk(List<Reimbursement> updated) {
        //TODO finish this update bulk function
        List<Reimbursement> reimbursements = null;
        try {
            connection = ServiceLocator.getERSDatabase().getConnection();
            connection.setAutoCommit(false);
            ReimbursementDAO reimbursementDAO = new ReimbursementDAO(connection);
            for (Reimbursement reimb:
                 updated) {
                if(reimb.getReimbStatus().getId()==1)
                    reimbursementDAO.approve(reimb,true);
                else if(reimb.getReimbStatus().getId()==3)
                    reimbursementDAO.approve(reimb,false);
            }
            connection.commit();
            reimbursements = reimbursementDAO.queryPending();
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                return reimbursements;
            }
        }
    }

    public List<ReimbursementType> getAllReimbursementTypes() {
        List<ReimbursementType> types = null;
        try {
            connection = ServiceLocator.getERSDatabase().getConnection();
            types = new ReimbursementTypeDAO(connection).queryAll();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                return types;
            }
        }
    }
}
