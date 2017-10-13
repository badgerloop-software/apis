<?php

class Queries {

	const TIER = "SELECT name, value FROM `tier`";
	const AREA = "SELECT a.name as `area_name`, t.name, t.description FROM `area` a, `team` t where a.id = t.area";
	const MEMBER = "SELECT uid, eppn, position FROM `member`";
	const POSITION = "SELECT name, level FROM `position`";
	const TEAM = "select concat(m.`first_name`, \" \", m.`last_name`) as full_name , m.`email`, m.`headshot`, p.`name` as position_name, p.`mantra`, p.`description`, t.`name` as tier_name, y.`name` as `year` , mj.`name` as `major`, m.`linkedin` from `member` m, `position` p, `tier` t, `year` y, `major` mj where m.`position` = p.`id` and p.`level` = t.`id` and y.`id` = m.year and mj.id = m.major and m.`active` = 1 order by t.`id` desc, m.`last_name`";
	const MEMBER_TIER = "select t.id from member m, position p, tier t where m.position = p.id and p.level = t.id and m.email = '%s'";
	const SPONSORS = "SELECT t.name as `tier_name`, s.name, s.website, s.image FROM `sponsor_tier` t, `sponsors` s where t.id = s.`tier` and s.active = 1 order by t.id;";
	const MEDIA = "SELECT `title`, `source`, `date`, `type`, `url` FROM `articles` where `active` = 1 order by `title`;";

}