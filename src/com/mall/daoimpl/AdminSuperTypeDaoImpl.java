package com.mall.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mall.common.DbUtil;
import com.mall.dao.AdminSuperTypeDao;
import com.mall.po.SuperType;

public class AdminSuperTypeDaoImpl implements AdminSuperTypeDao{
	public boolean addSuperType(SuperType type) {
		DbUtil dao = null;
		PreparedStatement ps = null;
		String sql = "";
		boolean flag = false;
		try {
			dao = new DbUtil();
			sql = "insert into tb_superType values(null,?)";
			ps = dao.getCon().prepareStatement(sql);
			ps.setString(1, type.getTypeName());
			int i = ps.executeUpdate();
			if(i != 0) {
				flag = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				dao.close();
			} catch(SQLException s) {
				s.printStackTrace();
			}
		}
		return flag;
	}

	public List getSuperType() {
		List superTypes = new ArrayList();
		DbUtil dao = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		try {
			dao = new DbUtil();
			sql = "select * from tb_supertype";
			ps = dao.getCon().prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				SuperType superType = new SuperType();
				superType.setSuperTypeId(rs.getInt("superTypeId"));
				superType.setTypeName(rs.getString("typeName"));
				superTypes.add(superType);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				dao.close();
			} catch(SQLException s) {
				s.printStackTrace();
			}
		}
		return superTypes;
	}

	public boolean checkSuperTypeIsExist(String superTypeName) {
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		try {
			daoUtil = new DbUtil();
			sql = "select * from tb_superType where typeName = ?";
			ps = daoUtil.getCon().prepareStatement(sql);
			ps.setString(1, superTypeName);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				daoUtil.close();
			} catch(SQLException s) {
				s.printStackTrace();
			}
		}
		return false;
	}
	
	public boolean updateSuperType(SuperType type) {
		boolean fly = false;

		DbUtil dao = new DbUtil();
		PreparedStatement pre = null;
		String sql = "update tb_supertype set typeName = ? where superTypeId = ?";
		try {

			pre = dao.getCon().prepareStatement(sql);			
			pre.setString(1, type.getTypeName());
			pre.setInt(2, type.getSuperTypeId());
			pre.addBatch();
			pre.executeBatch();
			fly = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pre.close();
				dao.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return fly;
	}
	
	public boolean deleteSuperType(int[] ids){
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		Connection conn = null;
		 String sql = "delete from tb_supertype where superTypeId=?";;
		try {
			daoUtil = new DbUtil();
			conn = daoUtil.getCon();
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			for(int j=0;j<ids.length;j++) {
				ps.setInt(1, ids[j]);
				ps.addBatch();
			}
			int[] k = ps.executeBatch();
			conn.commit();
			if(k.length == ids.length) {
				return true;
			}
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} finally {
			try {
				ps.close();
				daoUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
}
