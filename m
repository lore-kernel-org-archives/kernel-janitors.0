Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021117.outbound.protection.outlook.com [40.107.130.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE967337BA3;
	Sun, 19 Apr 2026 10:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.117
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776593805; cv=fail; b=VH1H1Lswppp8TV6SuO/npgu6GsaZjo5HGcRuHalhfESiryUpztrHfcC8OzHzOxixnwx052veW4J6k8FLTBgpVnifHKxBbRFkAbTE4HE23YE41EHbGVrkZST3qOo8WgMvW9QlcW812/P8ibecTz/mUocEEQqJB6wC11RJzyQXkRo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776593805; c=relaxed/simple;
	bh=ZIa7cLUNUL8Lr4Bc2+F9cSLyNYfiiCKiTFcxWeCX7Cw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aob33cuWVTkkXjOCp7rPe4I5R1pRSD4i0B4bTF+NtNlsed5GBf6Frf30AqdeF4a69/PJVFzSWbOHpXzAjuYWJJwIOfAgw1FQ7TFopO7/tyMrFzcCjg9OjwBNORLXlGIHfAvNqF0J+AxBAj2S40VPtz6ymRownHuM1ZwDe2WIP/8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=DsyH6NPF; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=DsyH6NPF; arc=fail smtp.client-ip=40.107.130.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="DsyH6NPF";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="DsyH6NPF"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LTCEgTGwbR5MPjdgFooFC49bbXdzqtYzzN4d2Nbn5l5JH3tPL5zFPE4BQDWwLKVW7NacqvMY3tV2O4uZDfRf5svMG87XaOvKM6OvabwCiH5C1JWjwti/U5WhXH2p3V9641okIsIrPdylNuMmHKi2gVWwjKsEiZVkErJ76/SPIVdVfUa00oKbhHaA7SEqyJpTVbKQBQbRE85UEmjO0BcfOLnT1YWyNUJQNgFkIq2HJM6QfOwQIh4ohTsnfMwXLjfilcZRzGIS676whp+jLIBhY0B1QbBeIL6ZkpE1Ri1UGal7TGMZxV7j5gGK7CS8MPP95GibEB6mSLh87UamLUWlvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIa7cLUNUL8Lr4Bc2+F9cSLyNYfiiCKiTFcxWeCX7Cw=;
 b=O/9RYGOnuXENAqcx4Dkqwugg7Aj1814WEewVFR4LQvFaZpKvNPpdcRe6dTIfVl6kQD6hzGkSCj6c5Dd7qGSJuaxu+3t74iR4JjJIN7f7c+YJQzyyuMATqk8XFjFmHZ2Ug/MsWDEDetX9raMlV527dJIunjBsGYYHxFOxYUI2Mpb/W7pR7gLOd9kWEhUvaz5eW3gIQPbQpz8NEQAv7ZcQGmaANpn42bzbJHMIEcSHJWdgynLmNyc+B5kcvY7vQDGn3afeKmAfLESUnwx+5oRIy+UeddPYKPViDyD19SXcyx3WC5LO9xAaYOhTQm/7WCrNtK3kNjLpKNkQqLTd+KF7nA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=axentia.se smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIa7cLUNUL8Lr4Bc2+F9cSLyNYfiiCKiTFcxWeCX7Cw=;
 b=DsyH6NPFa6T+mvqyg4MRdKg6j+iIoEXW2J7VCr1xh3X1ykKMZsSenN8HA24jWZoMUO8giaQu4XSNSv53ltOp4FGQlx/5aB9ac3Ackp85vX8wm8hoINq0IyLel3Vyhn5P9plMuXMqY8RwK75cjHZ8N12RPp4AS+ZkzkE6O+pVLpzHbv4K99G4e7/w7+/ODKfD6D8sY8qMj6YhgfrYqdo/f7loI4TCkcC85ARrpbO/ZTCmAF4hebL0DTamRauFOxzwbKLHDrBH/UH98B9sBBuljYkaXDPlcIRE8RHjwA6WS4/MAbR4kRbxxbEJLiEdopeH2ZcVGVGuy6wqrqVgfQ5cyg==
Received: from AS4P192CA0030.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::18)
 by DB9PR04MB8348.eurprd04.prod.outlook.com (2603:10a6:10:25c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Sun, 19 Apr
 2026 10:16:39 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::ac) by AS4P192CA0030.outlook.office365.com
 (2603:10a6:20b:5e1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Sun,
 19 Apr 2026 10:16:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Sun, 19 Apr 2026 10:16:39 +0000
Received: from emails-4526198-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-150.eu-west-1.compute.internal [10.20.5.150])
	by mta-outgoing-dlp-291-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 11D008006F;
	Sun, 19 Apr 2026 10:16:39 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun Apr 19 10:16:33 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBnh+VPqdXwta+YaxtacxjQguc9RqyHpGDLTILGafM7Ln9qd7HxjHNwcRprZWTKew4WdIpoi1mrd389+DyTsVyCEoqUYIb3NKcuD0fO4hCp7m+IH4sZEnVguVZQryMPfGgtDTDXaPfX2GJZsBcmjLZdi4jPGKgHdZGuRFWKiUR9Ce0yh0zvqE9IZiLt4BJS9q2PN7mLnT0UAkphjbwhjbp9IRiUSIDNY1Q7WRz36AH9GgHejQK2URMUNMX1Q2D7K+Cg5hJUBY+Vp3XWqrau1SyAjS4Tmo/LK6S0LYcOn2u6y3jHqKQzcTjobIHS5ZEZy52xtrk83HkXyAMd2UOIXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIa7cLUNUL8Lr4Bc2+F9cSLyNYfiiCKiTFcxWeCX7Cw=;
 b=l0kJilSHugtxxSWvG6v3rpMkHx0ESpgNtn84CyllhBh/oF/4+N4QK1sUjMuQM+YrtGDRRIiyd95yDHf/6jIIvtj4/E/ah/yqOfVZjMe3oY1SU52l1VmgTLcpLAKvF/EwZIRrcsI4ICFQa3az6EIRXT0ZBx0WE6pwqtfnxOEhahRDymR5YXCrALMJzoM7NTYaETkrHEKkttqEKXLC3NS90u7pY+auib/LVwmS0O74WYVsCl1vFqyx50swHQZdyCVYJ+5JvXXylQv3ie19iDhIAgeEts4Wo7GON1mZj7g2M66Rd0t17a9qYvO18G891Z8FPgFMaf300C8azLbOb4EwRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIa7cLUNUL8Lr4Bc2+F9cSLyNYfiiCKiTFcxWeCX7Cw=;
 b=DsyH6NPFa6T+mvqyg4MRdKg6j+iIoEXW2J7VCr1xh3X1ykKMZsSenN8HA24jWZoMUO8giaQu4XSNSv53ltOp4FGQlx/5aB9ac3Ackp85vX8wm8hoINq0IyLel3Vyhn5P9plMuXMqY8RwK75cjHZ8N12RPp4AS+ZkzkE6O+pVLpzHbv4K99G4e7/w7+/ODKfD6D8sY8qMj6YhgfrYqdo/f7loI4TCkcC85ARrpbO/ZTCmAF4hebL0DTamRauFOxzwbKLHDrBH/UH98B9sBBuljYkaXDPlcIRE8RHjwA6WS4/MAbR4kRbxxbEJLiEdopeH2ZcVGVGuy6wqrqVgfQ5cyg==
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by AM9PR04MB8987.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Sun, 19 Apr
 2026 10:16:31 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%6]) with mapi id 15.20.9769.046; Sun, 19 Apr 2026
 10:16:30 +0000
From: Josua Mayer <josua@solid-run.com>
To: Dan Carpenter <error27@gmail.com>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Peter
 Rosin <peda@axentia.se>, "kees@kernel.org" <kees@kernel.org>,
	"thorsten.blum@linux.dev" <thorsten.blum@linux.dev>, "ulfh@kernel.org"
	<ulfh@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [bug report] mux: Add helper functions for getting optional and
 selected mux-state
Thread-Topic: [bug report] mux: Add helper functions for getting optional and
 selected mux-state
Thread-Index: AQHcyNKYkq8pnSRAUEyygYtzYDcOGLXmOYgA
Date: Sun, 19 Apr 2026 10:16:30 +0000
Message-ID: <f76494f0-e44e-49de-bee1-84399307f3f0@solid-run.com>
References: <adjNEl0C8OgEjMI7@stanley.mountain>
In-Reply-To: <adjNEl0C8OgEjMI7@stanley.mountain>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	GVXPR04MB12057:EE_|AM9PR04MB8987:EE_|AMS1EPF0000004C:EE_|DB9PR04MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb364c5-1643-48d0-5049-08de9dfcbeec
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 2FtBIss1CQCd07PGFMWgu9OAyC1WGQBjEqqQGzjdEw5YAEQKw8JedjMMSSn5AAXLjnkQ4QQ/+0B0xbaSEs8KawzVS7p0jd9ZwEndpNSwjLmwODiAbdNyFucWRdjtjd3CH8+ggdUpkdTFYDO6rEhShdRbPdpJ2DEvvrdY1rJ8Sj6c2iWsBUhN6mdgqFDMEMV4ZN5lrGgGZiPTSBrI+/hRS1tYFpA/Oix6z+er0kO3+4h8EFHGUUztKH0x5Ao+6msTkvw7/F9/A71E7+znLbaoqon31A95Ia4p6KEncPxI3lI6xGSxjhgM8Sf/1D4F5y7vzd3newL39jpm5oSbDqJnYWb8jiVcHxX7f6DHJga17I4O7In3TT6iVByZ8SqPOhu68kXNHSFNVtFJRSnmkRQyAkwwtp/TUe4DjH/PdM4Eghwo55i3XlD0zxyiL/4NcHyU7OVq0ecHpweACj0fal7+zjO9G7nOP9Lj8haU/pSOgDVFaBxMI8DBRkymUSIgYosdr3wcgAiy8o7XOAjVUds/5qot4p7u1pg4jfPsmGCcDNX+7nyycglY+Pvzr9IviJNbDOogp0EHKgbUK19GoEfLYpo+NIp8Pa+MQ/xX8iXrJkEcElenAxOk/vCSUfohSr0pnjLnCaJwOaMKVNeNir/+/I5HjHUljijqAie7j/FTe2DVsMKSwUKZuQVxpHjHG8qbqUcAG29qODSEI5+05uQ6l9Mnv1812EMikFULeV7uTHxR/j42UJYp8e8mvA2iJotmCBk/bFyp13ko5M9A9INrjD/k8+udwzdBpz8a8bPTNQU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <482B0BAF5D976246BA38D8FA1C8B9C67@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 rqruWmoH1he5ztMXu0dM2xTjMC+h/1b0AKv7tBSrFSQpRADitS2/RtDAfaIoB3QIWJP+RjEKSWFsmly2ulp0kBX2OFfVEZ6hODCGXoGQuXPmAogSLUtfblwTFZOU51ybqkYlUSnw7735n1eoCSxFZtNNmvEARlEeM7EgvBySZUqVaFiVGAUpnkSg5Fwa8nriWJ/jL/2Ph/Czv+nBQ1LU4JwVgRK/7iUEuWc5VlVD0AYkntdQX0sQN/q+8p898Suz7AtbGixBuFtiRFOHm0NvZhKWOPACZVhiI4JfPX2Pc35OtNaTgnxiWk3o3fEf8Aiqb/kOnUrnc/+ddj1F5UDJUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8987
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-6.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 75c41016c66b4edd93f0cff2dfea2fa3:solidrun,office365_emails,sent,inline:c11999d862887b03ff4a31cc89ec27e7
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b10c4ffd-4715-4bb2-1d89-08de9dfcb9de
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|35042699022|376014|14060799003|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	28TADQuHZhF5FYVNb0h8VLSQ0WZg7ANlmd2IYGYY8M6Ju6ed7kcQfJTQvE/a0JHmrnullEO78CJVoE4u4BJmOwuOyKl4NeO/nU7s469eh2qrmYGRIDBITQGvfYM/gysgG+b9juK1ZVLuS5VGdqI707OWuoY7daFaOLbMhLgxfr/lH3xqXTln285ydvA899gD+VYNiK/5ZXmDZ7w3da72NGSzTMWsOfxQogPWxoGyfFfPgJLoK9Ys+IxNtm5bFG9hrVzzwpssNcyZTIGgiRKClDWaWi2gQgIG25/q2uWkInFLOYd5MlSkNXVzrYHA8hr/OesA+PzGAfl/ZsMlK9jqGGFjz0KotE2kjCp3HbCZ5ZK+k9MjLYINeEqhBJ1clHYBhfGHB3LD1E8li+kohMtRUGl/YFpDtKQpNxqX9ryBjsosyC+59vaKX3KYJ91O0wqGXRvNY1gBB+m8DHPCZbJDaFl4w7LV09guCATNHnH2uOASheaNXKonJZZMunBp/YS9y20/oA3VoXT/YODvWFOig5/jP03WPsaU/Iju8Z9vSH3P1Wvtw26nOCypKmCe3u9N2sh7YF01xS8ddbu7pEg8a/plWWloLRLnfbAtTej2rs0sZ4WeDw9pERaHw8vinWueDXqu9bZWciXgjY5siH71nGDtZcF6nEm9ljzQyPT3OzXrzeOSA3rM7EyAY8hE/y2vcWJRhtvitNvUWwcTA4QW61H3CqWtpGKj0dDkOweCo8MBe8rghf4k2Jkfy3AR2/aORIkfJUojyFrzNCokosPM2Q==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(376014)(14060799003)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fc7LmhiiwKPjBqHJU0qZRNdsilHcy5VzQGODmdOuMBsGCqfwBgDpa65juVhwgQbjKqLnkHkR2ZDv3eX8YaGqSN5xqr09p3V3XjwHZLeWQDGQq3Vup1UI5SBD3JENX9aFwtF8IgR65LgJouIR9exCl+8ZzNwan0dySS2lJhkuCClW5PH/XMEJ1zSQs7bKGCjNb3zkxYRv22yyYChhG7YgG4hWgKpp6Ci+BywqwaaAlyAc0etU9hwDdAwn1Rh7md92qCcmhEOusdzLCobLJCjGCh1bL1nx3OmqSyeyifIrPgAaOqWzpcxEiMBplQDW0hHi1xzedf3wrO/T/m1wdC7CUCN/3fQlXZ26+uk4XyLzwpILreHvNGpRBJLZ7x2mzTSmVM371EcfLZm+305oKwOwkUzNqup1a2guUbkqbSukvrY3HPfzW1dKBavZhcsbJQd2
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2026 10:16:39.2806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb364c5-1643-48d0-5049-08de9dfcbeec
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8348

SGkgRGFuLA0KDQpBbSAxMC4wNC4yNiB1bSAxMjoxMiBzY2hyaWViIERhbiBDYXJwZW50ZXI6DQo+
IEhlbGxvIEpvc3VhIE1heWVyLA0KPg0KPiBDb21taXQgOTkzYmNhZjMyYzQ5ICgibXV4OiBBZGQg
aGVscGVyIGZ1bmN0aW9ucyBmb3IgZ2V0dGluZyBvcHRpb25hbA0KPiBhbmQgc2VsZWN0ZWQgbXV4
LXN0YXRlIikgZnJvbSBGZWIgMjYsIDIwMjYgKGxpbnV4LW5leHQpLCBsZWFkcyB0byB0aGUNCj4g
Zm9sbG93aW5nIFNtYXRjaCBzdGF0aWMgY2hlY2tlciB3YXJuaW5nOg0KPg0KPiAJZHJpdmVycy9t
dXgvY29yZS5jOjY0MCBtdXhfY29udHJvbF9nZXQoKQ0KPiAJd2FybjogJ211eCcgaXMgYW4gZXJy
b3IgcG9pbnRlciBvciB2YWxpZA0KPg0KPiBkcml2ZXJzL211eC9jb3JlLmMNCj4gICAgIDYzMCAg
KiBtdXhfY29udHJvbF9nZXQoKSAtIEdldCB0aGUgbXV4LWNvbnRyb2wgZm9yIGEgZGV2aWNlLg0K
PiAgICAgNjMxICAqIEBkZXY6IFRoZSBkZXZpY2UgdGhhdCBuZWVkcyBhIG11eC1jb250cm9sLg0K
PiAgICAgNjMyICAqIEBtdXhfbmFtZTogVGhlIG5hbWUgaWRlbnRpZnlpbmcgdGhlIG11eC1jb250
cm9sLg0KPiAgICAgNjMzICAqDQo+ICAgICA2MzQgICogUmV0dXJuOiBBIHBvaW50ZXIgdG8gdGhl
IG11eC1jb250cm9sLCBvciBhbiBFUlJfUFRSIHdpdGggYSBuZWdhdGl2ZSBlcnJuby4NCj4gICAg
IDYzNSAgKi8NCj4gICAgIDYzNiBzdHJ1Y3QgbXV4X2NvbnRyb2wgKm11eF9jb250cm9sX2dldChz
dHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKm11eF9uYW1lKQ0KPiAgICAgNjM3IHsNCj4g
ICAgIDYzOCAgICAgICAgIHN0cnVjdCBtdXhfY29udHJvbCAqbXV4ID0gbXV4X2dldChkZXYsIG11
eF9uYW1lLCBOVUxMLCBmYWxzZSk7DQo+DQo+IG11eF9nZXQoKSBjYW4gb25seSByZXR1cm4gTlVM
TCBpZiBvcHRpb25hbCBpcyB0cnVlLg0KDQpZZXMsIHRoYXQgaXMgdGhlIGludGVuZGVkIGNvbnRy
YWN0LiBUaGlzIG1lYW5zIGZ1bmN0aW9uIGNhbiBiZSBzaW1wbGlmaWVkOg0KDQovKioNCsKgKiBt
dXhfY29udHJvbF9nZXQoKSAtIEdldCB0aGUgbXV4LWNvbnRyb2wgZm9yIGEgZGV2aWNlLg0KwqAq
IEBkZXY6IFRoZSBkZXZpY2UgdGhhdCBuZWVkcyBhIG11eC1jb250cm9sLg0KwqAqIEBtdXhfbmFt
ZTogVGhlIG5hbWUgaWRlbnRpZnlpbmcgdGhlIG11eC1jb250cm9sLg0KwqAqDQrCoCogUmV0dXJu
OiBBIHBvaW50ZXIgdG8gdGhlIG11eC1jb250cm9sLCBvciBhbiBFUlJfUFRSIHdpdGggYSBuZWdh
dGl2ZSBlcnJuby4NCsKgKi8NCnN0cnVjdCBtdXhfY29udHJvbCAqbXV4X2NvbnRyb2xfZ2V0KHN0
cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqbXV4X25hbWUpDQp7DQrCoCDCoCByZXR1cm4g
bXV4X2dldChkZXYsIG11eF9uYW1lLCBOVUxMLCBmYWxzZSk7DQp9DQpFWFBPUlRfU1lNQk9MX0dQ
TChtdXhfY29udHJvbF9nZXQpOw0KDQpJcyBpdCBva2F5IHRvIHRydXN0IHN1Y2ggdHJhbnNpdGl2
ZSBjb250cmFjdHMgYW5kIG5vdCBjaGVjayBmb3IgTlVMTA0KaW4gYW4gZXhwb3J0ZWQgZ2VuZXJp
YyBoZWxwZXIgZnVuY3Rpb24/DQoNCj4NCj4gICAgIDYzOSANCj4gLS0+IDY0MCAgICAgICAgIGlm
ICghbXV4KQ0KPg0KPiB0aGlzIHNob3VsZCBiZSBpZiAoSVNfRVJSKG11eCkpIHsNCj4NCj4gICAg
IDY0MSAgICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVOT0VOVCk7DQpObywgRU5PRU5U
IGlzIG9ubHkgdGhlIGZpeCBmb3IgdW5leHBlY3RlZCBOVUxMIHJldHVybiwNCndoaWNoIG11c3Qg
bm90IGJlIHByb3BhZ2F0ZWQgdG8gdGhlIGNhbGxlci4NCg0KT3RoZXIgZXJyb3JzIHNob3VsZCBi
ZSByZXR1cm5lZCB0byB0aGUgY2FsbGVyIHVuY2hhbmdlZC4NCg0KPiAgICAgNjQyIA0KPiAgICAg
NjQzICAgICAgICAgcmV0dXJuIG11eDsNCj4gICAgIDY0NCB9DQo+DQo+IFRoaXMgZW1haWwgaXMg
YSBmcmVlIHNlcnZpY2UgZnJvbSB0aGUgU21hdGNoLUNJIHByb2plY3QgW3NtYXRjaC5zZi5uZXRd
Lg0KcmVnYXJkcw0KSm9zdWEgTWF5ZXI=
