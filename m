Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AD13E7BC5;
	Thu,  4 Jun 2026 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780562754; cv=none; b=B3YvsTRvzlkeNLTWQNh2OrZDUB8f/ZWPF9vVYfbcbpEjySiHqneOjR9GQC0Ff8NxvvBXJFphn0XTxHe2JsmbRBv3ycIaR1OC1tYApVBvKoF/ITExBTHcNLxQlGJ5DwKXjug9qk9S5ZUNhOSz+kFi99VIw+tORpbFalqlkNzXrtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780562754; c=relaxed/simple;
	bh=za8DHGu3biwKkcTGOyrj8iiJ148cR0bJWfr3d6zk8z0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=IjUTgCGBnqx+zIA4TWWk83LlqlXpCqUxzg733H7AKdtFVybP0wgoXMDn6kQEMBfbAyVk7PBaZY2RLd1PnZ2s3yW7Gp/zoV3sJ0Kz9Zew+kemxqZo/GLG/y+ncOjO58p5tTEawQXOoIj87bDzSwcyG+9vRnX0G9FhsfF2luFBG68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=TAVTvqNl; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="TAVTvqNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1780562740; x=1781167540; i=markus.elfring@web.de;
	bh=S+hjzIrDTeIODDL5m7s+ngimdUqXBpyiitAoczEsaSs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Cc:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TAVTvqNlN9wq4OEuIa7fKBQxGrv2uZg/nYcXn4hzzYiiXr9Y/nYFBdiVB4HeAJD5
	 86Xpk6At0SISUW9VoKdKRYw/qEX4J6r1g7PDsciMnv9w5ylP35iCyaZL0PJVhKEPt
	 xA+dbm8g9EhW85TNKWWEizEuPyq5pByRhzDgOfkb3Ojx69qxZLaH2MgDlZ24XphOl
	 Mn8NU1tbIFSa2tVQs8u0gnIDJI4uwV7QoAqqAyBFg4CbhF1O5f2pwqwdNbuuEmKL4
	 n87W/m4d8b8Lm5ch/W/sgic0+SOojmxneaCatbVin9G3rGncaQ2I7/GUyZv6kfmAj
	 Y4LFLhEx+NjNT3e+zA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MYu1C-1wiH7j3smG-00MfGZ; Thu, 04
 Jun 2026 10:45:39 +0200
Message-ID: <126a924b-6f68-43bf-ae5a-449fb93e527b@web.de>
Date: Thu, 4 Jun 2026 10:45:36 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] zsmalloc: Simplify data output in zs_stats_size_show()
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jmFiDZfJJ4Gtd7CB5aqbrRA9lWmoW0szILtpZ1pIIRHjjUpIQCc
 IZnr7R5TdsWQGdm4LBw8vnjDKl7X/cMYxtq3q7+JcvOvdKKEc9eogPFW1TacJTzZoDf6b93
 Rl9binAQ/vcQmGGF/JkvqRk7E8aAz4D78obnPzAPi0KCqNeemRrma8N/GPF2ADtvt96t6bk
 yCReUQG6NUPUoSfA36ViQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Cfx44kd3Ia0=;3y7AoRAty/aFc6xEFaaiqevWzsa
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jun 2026 10:20:03 +0200

Move the specification for a line break from a seq_puts() call
to a seq_printf() call.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 mm/zsmalloc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 63128ddb7959..83f5820c45f9 100644
=2D-- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -565,8 +565,7 @@ static int zs_stats_size_show(struct seq_file *s, void=
 *v)
 		total_freeable +=3D freeable;
 	}
=20
-	seq_puts(s, "\n");
-	seq_printf(s, " %5s %5s ", "Total", "");
+	seq_printf(s, "\n %5s %5s ", "Total", "");
=20
 	for (fg =3D ZS_INUSE_RATIO_10; fg < NR_FULLNESS_GROUPS; fg++)
 		seq_printf(s, "%9lu ", inuse_totals[fg]);
=2D-=20
2.54.0

