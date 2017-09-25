<?php

require_once 'Secrets.php';

class WebsiteData {

	private $conn;

	function __construct() {
		$cred = new Secrets();
		$this->conn = new mysqli($cred->servername, $cred->username, $cred->password, $cred->schema);
		if ($this->conn->connect_error) {
			die("Connection failed: " . $conn->connect_error);
		}
	}

	function __destruct() { $this->conn->close(); }

	function getTiers() {

		$data = array();

		if ($result = $this->conn->query("SELECT name, value FROM `tier`;")) {
			while ($row = $result->fetch_object())
				$data[] = $row;
			$result->close();
		}

		return $data;
	}

	function getAreas() {

		$data = array();

		if ($result = $this->conn->query("SELECT a.name as `area_name`, t.name, t.description FROM `area` a, `team` t where a.id = t.area")) {
			while ($row = $result->fetch_object())
				$data[] = $row;
			$result->close();
		}

		return $data;
	}

	function getMembers() {

		$data = array();

		$member_query = "SELECT uid, eppn, position FROM `member`;";
		if ($result = $this->conn->query($member_query)) {
			while ($row = $result->fetch_object())
				$data[] = $row;
			$result->close();
		}

		return $data;
	}

	function getPositions() {

		$data = array();

		$member_query = "SELECT name, level FROM `position`;";
		if ($result = $this->conn->query($member_query)) {
			while ($row = $result->fetch_object())
				$data[] = $row;
			$result->close();
		}

		return $data;
	}

	function getTeam() {

		$data = array();

		$member_query = "select concat(m.`first_name`, \" \", m.`last_name`) as full_name , m.`email`, m.`headshot`, p.`name` as position_name, t.`name` as tier_name, y.`name` as `year` , mj.`name` as `major` from `member` m, `position` p, `tier` t, `year` y, `major` mj where m.`position` = p.`id` and p.`level` = t.`id` and y.`id` = m.year and mj.id = m.major";
		if ($result = $this->conn->query($member_query)) {
			while ($row = $result->fetch_object())
				$data[] = $row;
			$result->close();
		}

		return $data;
	}
}

