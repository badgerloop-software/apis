<?php

require_once 'Secrets.php';
require_once 'Queries.php';

class WebsiteData {

	private $conn;

	function __construct() {
		$this->conn = new mysqli(Secrets::SERVERNAME, Secrets::USERNAME, Secrets::PASSWORD, Secrets::SCHEMA);
		if ($this->conn->connect_error) {
			die("Connection failed: " . $this->conn->connect_error);
		}
	}

	function __destruct() { $this->conn->close(); }

	private function query($str) {
		$data = array();
		if ($result = $this->conn->query($str)) {
			while ($row = $result->fetch_object())
				$data[] = $row;
			$result->close();
		}
		return $data;
	}

	public function getTiers() {
		return $this->query(Queries::TIER);
	}

	public function getAreas() {
		return $this->query(Queries::AREA);
	}

	public function getMembers() {
		return $this->query(Queries::MEMBER);
	}

	public function getPositions() {
		return $this->query(Queries::POSITION);
	}

	public function getTeam() {
		return $this->query(Queries::TEAM);
	}

	public function getMemberTier() {
		return $this->query(sprintf(Queries::MEMBER_TIER, $_GET['email']));
	}

	public function getSponsors() {
		return $this->query(Queries::SPONSORS);
	}
}

