package com.macro.cloud.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.macro.cloud.bean.SysMenu;

import java.util.List;

/**
 * (SysMenu)表数据库访问层
 *
 * @author guojunwang
 * @since 2021-03-15 17:05:24
 */
public interface SysMenuMapper extends BaseMapper<SysMenu> {

    List<SysMenu> selectMenuByRoleId(String roleId);

    List<SysMenu> selectMenuByUserId(String userId);

    /**
     * 查看菜单访问规则
     * key: 访问路径
     * value:所需要的权限(admin,test,)
     * */
    List<SysMenu> selectAll();

}
