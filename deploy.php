<?php
/**
 * Auto deploy code
 * Thanks to HungNT for the idea!
 *
 * @author CongTS <congts.vn@gmail.com>
 * @homepage https://congts.com
 */
$deployBranch = 'develop'; // change your branch

$json = file_get_contents('php://input');
$jsonArr = json_decode($json, true);

$branch = $jsonArr["ref"];
if (strpos($branch, $deployBranch) !== false) {
    shell_exec('/bin/sh deploy.sh --branch ' . $deployBranch);
}

