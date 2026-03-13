Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1EC3CCFDB;
	Fri, 13 Mar 2026 17:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773423100; cv=none; b=XWnpHrgeCSNMt9cY42Hpu4CtoWanLWPrn4Hi7GxNZOl4f6qDPF77saG6nKU3n6Q3R0pefDCEquRO5Q9okoQ/6/c2uLk70x3yjEjhC9ZG0D3PaAm2Jbf3b1cGqjVMHPA0CFRjKOVT1DUo6f5MjZwTz3N3M3JX6tQzp+njJCs1URg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773423100; c=relaxed/simple;
	bh=1NcYho1iGlt3XnRGqlQVQ9IJZMCmTTEzQI0ER0cboKw=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=YxvEkXw1jVI8+HG/j8mFzvqbgq9m+ase8eZjFxcsEceKrxinbQBEgt2GIduR9MnD89LEKRlCA2uRoc/BwjL+qawMyI60e8wPEg0ZSCevE2xDChuOIscxdwMrgczRHeo1LqGtgpB3aCjZiFyv/1NyfmfvbFlp/bW4I8NkNkTvvno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Ov+7bovb; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Ov+7bovb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773423072; x=1774027872; i=markus.elfring@web.de;
	bh=huuTkZFjlnKV77Zy5MuXVWaQQebgl9Nl3Zi0dBkFraI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ov+7bovbqAiJB+E5HqRH2b/Sa0DKHA99D1uYipYnKFDut8VFcH/bEMfm7wAtW2sa
	 3acmSFMsUPyDDOpq93NMv/3X13NO50RaKJjvZhqOV3/36NsaXIrMlMdh8oP7IHsCM
	 GO+vBfcI6BneOdBAKvtTzrkG6c+UoEauFFwVNiwb1bCJfi+Pre6cCBzfGpbzRzLsz
	 owgp3qMYdFjy6xTM0lELxckZc027dkNJoljA7Swg+x6t4xuwTgB07oBWGyxqX9i45
	 0zfWjnSF+RJo8Muir7IlrBLIdQbXW44YDK3gN/udcxXs18U4gnU0eXy/k61plp/Os
	 fywuXufPYbsCyIrccA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MNORC-1wGzZN3F98-00SzA2; Fri, 13
 Mar 2026 18:31:11 +0100
Message-ID: <4fa1cbbe-506d-4acc-acd6-57700d76d0e2@web.de>
Date: Fri, 13 Mar 2026 18:31:02 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, de-DE
To: cocci@inria.fr, kernel-janitors@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, Alejandro Colomar <alx@kernel.org>,
 Felix Gu <ustc.gu@gmail.com>, Philipp Hahn <phahn-oss@avm.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: =?UTF-8?Q?=5BPATCH=5D_Coccinelle=3A_api=3A_Add_SmPL_script_?=
 =?UTF-8?B?4oCccG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeS1kZWxldGlvbi5jb2NjaeKAnQ==?=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bxkThwH0ddhMfNrjXZrhpmXcI8FKvr5/5MXot1SKPntsFGDAdU/
 0rwzaOyECAZJ0sZYnQIIjmROHVTQ/lYvTVOwGVubKjVqmgyQ7KEnOe8N5iUWV62xp2jrWfX
 24ZNH6fk8aRM/cpkoai+yasS+PRqkHToQTzKAeb5qek1nIdHMctevRW9H0t6tUUtgp0wK6M
 bN4Z9j6Joeiwo7xzHvZ/A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wog42B0XDCQ=;99JGrzbACzzsTvsAgvqCV8hU8M9
 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
 32AhJ6+gd+3ae0mxRD5BxUFQ==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 13 Mar 2026 18:15:11 +0100

The device's last busy timestamp was set in a wrapper function since
the commit b3db492e8335417dfd66c1fa2ea08e1d2f7b6736 ("PM: runtime:
Mark last busy stamp in pm_runtime_put_autosuspend()").
Thus delete pm_runtime_mark_last_busy() calls before
pm_runtime_put_autosuspend() calls.
Provide design options for the adjustment of affected source code
by the means of the semantic patch language (Coccinelle software).

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 .../pm_runtime_mark_last_busy-deletion.cocci  | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 scripts/coccinelle/api/pm_runtime_mark_last_busy-delet=
ion.cocci

diff --git a/scripts/coccinelle/api/pm_runtime_mark_last_busy-deletion.coc=
ci b/scripts/coccinelle/api/pm_runtime_mark_last_busy-deletion.cocci
new file mode 100644
index 000000000000..fa17fd8ea43b
=2D-- /dev/null
+++ b/scripts/coccinelle/api/pm_runtime_mark_last_busy-deletion.cocci
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+/// Omit pm_runtime_mark_last_busy() call before pm_runtime_put_autosuspe=
nd().
+//
+// Keywords: wrapper function access timestamp autosuspend
+// Confidence: High
+// Options: --no-includes --include-headers
+
+virtual context, patch, report, org
+
+@depends on context@
+expression e;
+@@
+*pm_runtime_mark_last_busy(e);
+ pm_runtime_put_autosuspend(e);
+
+@depends on patch@
+expression e;
+@@
+-pm_runtime_mark_last_busy(e);
+ pm_runtime_put_autosuspend(e);
+
+@x depends on org || report@
+expression e;
+position p;
+@@
+ pm_runtime_mark_last_busy@p(e);
+ pm_runtime_put_autosuspend(e);
+
+@script:python depends on org@
+p << x.p;
+@@
+coccilib.org.print_todo(p[0], "WARNING: Delete pm_runtime_mark_last_busy(=
) call before pm_runtime_put_autosuspend()")
+
+@script:python depends on report@
+p << x.p;
+@@
+coccilib.report.print_report(p[0], "WARNING: Delete pm_runtime_mark_last_=
busy() call before pm_runtime_put_autosuspend()")
=2D-=20
2.53.0

