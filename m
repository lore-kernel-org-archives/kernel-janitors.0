Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715854;
	b=t/M2XwcESAYtaVSoTBauPThEOkxfBhiNKwjoVj+0Cizjh4ZtXyVgTRf3ZYA8ZIbOkXXj
	 FPdONjjLqpIRQ6vqKiqpy0nF31xXJd3jRJX1DuU1KNq/K25C4kwe2LOj5iiTKQEyW0pgz
	 uFBFRIluO+E8gbKejX+hqTXMUiJvedotAH2nFezo+A5gzXs9l83rxrNxpsS0eqw/UBN7T
	 21xrf3Gmp/AKhm8VfTYPLgBrPRQqdejoBbgq6xONacb9/j+ebjGXtWHHz5Viw9LOcUu0j
	 M6ffoHbNWXn/HRVsU2HBsakHClTNT9E4PvRmG/72nqQdHZJfv1GMtzwrC0UBf/uP1Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715854;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:To:Content-Language:Cc:From:Subject:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=nie98FWDqN9gi2xgJoMHipVQYiig9NK4TUDtric5vU4=;
	b=5pWbgmn+BqKc/d7zRGLgOzecGQ8ICoPLGcljzEjJl2SC29uGfz24chw4hgR5phY9e00r
	 X2U42016foRHR+f3DD8UMGUKPyoaxP/yibq/b1DO56mNyWAeh9/lq0h9riTvnzpctJ5Zm
	 rZ1PI+ojpqw8qTrQhpNSlH1vvCuEXQflwq+t274IqFcbMqJNpvtG++GJaWUbkePKfE0++
	 4boTA3R1E47bvKXdoDiMJBcPd9BHgRT1ep/Gr68iMrT153y4Z1OmQ3cS38h+4C1p38uY+
	 cFACPLWj9KjXGOtIZym75SnhT2AO9AGFT9zx4ocRldpQGRq7bXMo3WH6SKxyStKLSLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=rYRwbvgX;
	arc=none smtp.remote-ip=212.227.17.11
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2119D606A326;
	Tue,  3 Nov 2026 14:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2119D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=rYRwbvgX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1793715846; x=1794320646; i=markus.elfring@web.de;
	bh=nie98FWDqN9gi2xgJoMHipVQYiig9NK4TUDtric5vU4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rYRwbvgX4eXolKA3aOgFge3taQDY/3pUsVLkVXk/Ufqsv7/j/i0EVMlYYGky2TQZ
	 jWzS+nni+PfKB5Xh1WoCo5rKwTzbd1NEASQjpO2Xv11LrodRz2RGxW+xzBsLuDMKU
	 4s4yGsMwPFrfIxTwLUk9dIZD3KOFdw3gjmHZgtAzgix6wWxsZhcQvSYYxH+wqaej/
	 524wA7XJn4a8w+QDYKDguy/3AMn/llDvuaj9py8grvz6GciySwTXGYAHV/seF0cMq
	 rtxb52tXJLEePyrYuf9aBh5+z/8VNRLpzE7qKprgQ9lWRUFMQvtYXcYsdHVbyVpuQ
	 /2ij17NbfT9h4KqtBA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MLifq-1x6a3S1ALA-00Yila; Tue, 03
 Nov 2026 15:24:06 +0100
Message-ID: <52418f50-b3ff-461d-8e66-c10f70e35b2a@web.de>
Date: Tue, 3 Nov 2026 15:23:23 +0100
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cocci@inria.fr, tools@kernel.org
Content-Language: en-GB, de-DE
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [RFC] Replacing special goto statements by direct returns?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2LDeXWUFgmyKDJfO8OLnATJI3uY/MdjXzbdTUQUD1ESqsxzPDLB
 HhGh5mPTlDPi+3HVD1f33JyC09RbvOtRw3JqJqzySsmNlwxN8jRG6qC0hI3PdGkGSDBwQkG
 TawUY9dGytJWEZOnDnjU0nb/GU+/6H3OYZyDYUeuZNHaEbkNRFlRIHWFGqmRi88kc2bxSt1
 iRbx5D5dyAofIHew9kx1Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SiR72DuQUQQ=;CkNSSXQGasztztB6fglZ2qbVUSE
 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

Hello,

The documentation for the Linux coding style contains the following inform=
ation.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv7.4-rc1#n526

=E2=80=9C=E2=80=A6
The goto statement comes in handy when a function exits from multiple
locations and some common work such as cleanup has to be done.  If there i=
s no
cleanup needed then just return directly.
=E2=80=A6=E2=80=9D


Thus it seems that the following script for the semantic patch language
can work to some degree.


@replacement exists@
identifier label, var;
@@
-goto label;
+return var;
 ...
-label:
 return var;



Unfortunately, patches would be generated then by such a simple SmPL code
which would still preserve return statements that became unreachable.

Test result example:
Markus_Elfring@Sonne:=E2=80=A6/Projekte/Linux/next-analyses> time spatch -=
-allow-inconsistent-paths fs/xfs/libxfs/xfs_btree.c =E2=80=A6/Projekte/Coc=
cinelle/janitor/replace_goto_by_return2.cocci
=E2=80=A6
@@ -1735,7 +1735,7 @@ xfs_btree_increment(
                --lev;
                error =3D xfs_btree_read_buf_block(cur, ptrp, 0, &block, &=
bp);
                if (error)
-                       goto error0;
+                       return error;
=20
                xfs_btree_setbuf(cur, lev, bp);
                cur->bc_levels[lev].ptr =3D 1;
@@ -1747,8 +1747,6 @@ out1:
 out0:
        *stat =3D 0;
        return 0;
-
-error0:
        return error;
 }
=E2=80=A6
real    0m1,074s
user    0m0,995s
sys     0m0,071s



How should such a source code transformation approach be improved accordin=
gly?

Regards,
Markus
