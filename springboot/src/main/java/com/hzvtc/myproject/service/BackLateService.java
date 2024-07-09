package com.hzvtc.myproject.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hzvtc.myproject.dao.BackLateMapper;
import com.hzvtc.myproject.dto.ListQuery;
import com.hzvtc.myproject.entity.BackLate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

//用于处理晚归相关的业务逻辑。

//BackLateService类是一个服务层组件
//它依赖于BackLateMapper和BuildingService来执行与“BackLate”实体相关的操作，包括分页查询、保存或更新、删除和根据ID查询。
//这种设计遵循了Spring框架中的分层架构模式，使得业务逻辑与数据访问逻辑分离，提高了代码的可维护性和可扩展性。


//@Service注解：表明这个类是一个Spring服务组件，Spring的IoC容器会自动扫描到它并把它作为Bean注册到上下文中。
@Service
public class BackLateService {
//    @Autowired注解：Spring提供的注解，用于自动装配Bean。
//    这里自动注入了BackLateMapper和BuildingService两个依赖。
    @Autowired
    private BackLateMapper backLateMapper;
    @Autowired
    private BuildingService buildingService;

//    ListQuery<BackLate> listQuery：包含分页信息和查询实体的对象。
//    Long bid：表示宿舍楼的ID，用于获取该宿舍楼下的所有子建筑物ID。
//    PageHelper.startPage(listQuery.getPage(), listQuery.getRows());：使用PageHelper插件开始分页。

//    return new PageInfo<>(backLateList);：将查询结果封装为PageInfo对象，便于前端展示分页信息。
    public PageInfo<BackLate> list(ListQuery<BackLate> listQuery, Long bid) {
        List<Long> bIds = buildingService.getIdsByParentId(bid);
        BackLate backLate = listQuery.getEntity();

//    List<BackLate> backLateList = backLateMapper.list(backLate, bIds);：通过backLateMapper查询“BackLate”列表。
        PageHelper.startPage(listQuery.getPage(), listQuery.getRows());
        List<BackLate> backLateList = backLateMapper.list(backLate, bIds);
        return new PageInfo<>(backLateList);
    }

//    这个方法用于保存或更新“BackLate”实体。
//    如果backLate的id为null，则调用backLateMapper.save(backLate);进行保存。
//    否则，调用backLateMapper.update(backLate);进行更新。
    public void saveOrUpdate(BackLate backLate) {
        if (backLate.getId() == null) {
            backLateMapper.save(backLate);
        } else {
            backLateMapper.update(backLate);
        }
    }
//    这个方法根据传入的ID删除一个“BackLate”实体。
    public void delete(Long id) {
        backLateMapper.delete(id);
    }

//    这个方法根据传入的ID查询一个“BackLate”实体。
    public BackLate query(Long id) {
        return backLateMapper.query(id);
    }
}
