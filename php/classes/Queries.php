<?php

class Queries {

	const tier = "SELECT name, value FROM `tier`";
	const area = "SELECT a.name as `area_name`, t.name, t.description FROM `area` a, `team` t where a.id = t.area";
	const member = "SELECT uid, eppn, position FROM `member`";
	const position = "SELECT name, level FROM `position`";
	const team = "select concat(m.`first_name`, \" \", m.`last_name`) as full_name , m.`email`, m.`headshot`, p.`name` as position_name, t.`name` as tier_name, y.`name` as `year` , mj.`name` as `major` from `member` m, `position` p, `tier` t, `year` y, `major` mj where m.`position` = p.`id` and p.`level` = t.`id` and y.`id` = m.year and mj.id = m.major";
	const memberTier = "select t.id from member m, position p, tier t where m.position = p.id and p.level = t.id and m.email = '%s'";
	const sponsors = "SELECT t.name as `tier_name`, s.name, s.website, s.image FROM `sponsor_tier` t, `sponsors` s where t.id = s.`tier` and s.active = 1 order by t.id";

}

