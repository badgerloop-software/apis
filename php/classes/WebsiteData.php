<?php

require_once 'Secrets.php';
require_once 'Queries.php';

class WebsiteData {

	private $conn;

	function __construct() {
		$cred = new Secrets();
		$this->conn = new mysqli($cred->servername, $cred->username, $cred->password, $cred->schema);
		if ($this->conn->connect_error) {
			die("Connection failed: " . $this->conn->connect_error);
		}
	}

	function __destruct() { $this->conn->close(); }

	function query($str) {
		$data = array();
		if ($result = $this->conn->query($str)) {
			while ($row = $result->fetch_object())
				$data[] = $row;
			$result->close();
		}
		return $data;
	}

	function getTiers() {
		return $this->query(Queries::tier);
	}

	function getAreas() {
		return $this->query(Queries::area);
	}

	function getMembers() {
		return $this->query(Queries::member);
	}

	function getPositions() {
		return $this->query(Queries::position);
	}

	function getTeam() {
		return $this->query(Queries::team);
	}

	public function getMemberTier() {
		return $this->query(sprintf(Queries::memberTier,$_GET['email']));
	}
}

