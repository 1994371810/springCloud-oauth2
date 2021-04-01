package com.macro.cloud.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.macro.cloud.bean.SysRole;

import java.util.List;

/**
 * (SysRole)表数据库访问层
 *
 * @author guojunwang
 * @since 2021-03-15 17:05:24
 */
public interface SysRoleMapper extends BaseMapper<SysRole> {


    List<SysRole> selectRoleByUserId(Long userId);
}
