Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A2541687A;
	Wed, 22 Jul 2026 17:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784739807; cv=none; b=qHeRcYs2W7Cov8fDjM7Ab8fe0oVZD37+LW2deS07PfRwZim04sOrqSp7jL7iEN/oQ+oTrGbLEcNW+3dhb+MKJDS0TwAjr44dmlDI0/ruMemFdSnyMTaKVPV2AbzkveTGYyyA9c/IUmJinSl7HMWLdCKd0aBQaDXAUBE8McA3Vyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784739807; c=relaxed/simple;
	bh=XLVe659r31QP8pksCwmRLIspU4OAx33nDuEQjgPSPCQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=oQcBYRgr5mp8P7DVq7tId/Xqudb8yj3AxMC6ACgfsw685y9g9O19NY3zmQcGDO/H/YIAawXI8sfi9m8kawMy5ucP19qaOMzO2UhsybID9S2HDylEIWHYNhR8DNfOx5rRmX8MGdrg/fGUvw3d40KdrEVXv5lh+TD1LZObvo7waeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=sn1N1zd2; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="sn1N1zd2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1784739794; x=1785344594; i=markus.elfring@web.de;
	bh=8Muv9U4LmsTt/UoMMNelo82TJAD3A6tVlK9hzl65hFc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sn1N1zd2Jmq0xM89DPX/arG+3UxAUK77UewYhMulcwvtFJtyat4UPJgS1QcyyBgE
	 yxnqHR0P1mVRu730blzT2Z5fmpsfPWneV/3ICs1tDi05JTzD26enqxrgy9pGDQtV4
	 DQUrVNFQ09KMWWNP/cBOp5fSdasX1AnuCCa8ZGFq5D9C9V/6QkoWjjEUUzmMPVrJv
	 Sx/IWHKRWpI0cFF65z68D5P1vI2Qbl/Hl+vVbEc/Z5mMdUBeq2bi4bog4S7CiEvu2
	 K54xSD0/QHcWS232mX6Eu47vVYAO9kp+UVkcu3SHGVyOiyS/TJzKD227budiJ7uEY
	 l2Rf6gzwrgDSgeksnw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MVrft-1wNSAJ2le9-00Sx7M; Wed, 22
 Jul 2026 19:03:14 +0200
Message-ID: <202dfb21-f5a2-4550-8a1f-aa07d84db345@web.de>
Date: Wed, 22 Jul 2026 19:03:12 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cocci@inria.fr, kernel-janitors@vger.kernel.org
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Improving output for single characters (with SmPL)?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GKv/Npr8HWK2mPGBGhC1F1o4KndvnIWo7dW9Z9hnpHNv0BKAioJ
 GKNGyUBMwOi0W+H50TipaIhJBClUwD4ohVc4BMhD8q45azbLGYVXaLDQRl51+bKxOXmaxhf
 CMhnMBYMUcrr++dxAQJufwEK2KADzE/+/p1XsuffwYHYVPanVF3UtdaJkpeP+/x9xWQ9Gqt
 JaCqN0BqmUewobT4GpVrw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GkJRXsp0g+U=;2+TUDF1IUWqs3GWrhiZRaqPopV/
 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
 =

Hello,

I would like to achieve further source code adjustments by the means of
the following script variant for the semantic patch language.


Example:
@initialize:python@
@@
input =3D ''

def convert(item):
   mark =3D ["'", item, "'"]
   coccinelle.text =3D cocci.make_expr(''.join(mark))

def common_checks(unescaped):
   if input[1] =3D=3D '"':
      if input[2:] =3D=3D '':
         convert(input[0] if unescaped else '\\' + input[0])
      else:
         cocci.include_match(False)
   else:
      cocci.include_match(False)

@find_update_candidate@
constant char[] input_string;
expression input_context;
position pos;
@@
 fprintf@pos(input_context, input_string);

@script:python selection@
param << find_update_candidate.input_string;
text;
@@
if param[0] =3D=3D '"':
   input =3D param[1:]
   if input[0] =3D=3D '\\':
      input =3D input[1:]
      if input[0] =3D=3D '"':
         if input[1] =3D=3D '"':
            if input[2:] =3D=3D '':
               convert('"')
            else:
               cocci.include_match(False)
         else:
            cocci.include_match(False)
      else:
         common_checks(False)
   else:
      common_checks(True)
else:
   cocci.include_match(False)

@replacement@
constant char[] find_update_candidate.input_string, selection.text;
expression find_update_candidate.input_context;
position find_update_candidate.pos;
@@
(
-fprintf@pos
+putchar
 (
-stdout,
-input_string
+text
 )
|
-fprintf@pos
+fputc
 (input_context,
-input_string
+text
 )
)


Questionable test result (according to the software combination =E2=80=9CC=
occinelle 1.3.1=E2=80=9D):
Markus_Elfring@Sonne:=E2=80=A6/Projekte/Linux/next-analyses/tools> time /u=
sr/bin/spatch --timeout 23 -j4 --chunksize 1 --include-headers --no-loops =
-dir . =E2=80=A6/Projekte/Coccinelle/janitor/use_fputc-20260722.cocci > =
=E2=80=A6/Projekte/Bau/Linux/scripts/Coccinelle/tuning1/next/20260721/use_=
fputc.diff
=E2=80=A6
HANDLING: ./tracing/rtla/src/osnoise.c
An error occurred when attempting to transform some files.

real    0m34,627s
user    1m52,330s
sys     0m4,022s

Markus_Elfring@Sonne:=E2=80=A6/Projekte/Linux/next-analyses> lsdiff =E2=80=
=A6/Projekte/Bau/Linux/scripts/Coccinelle/tuning1/next/20260721/use_fputc.=
diff | wc -l
49

Markus_Elfring@Sonne:=E2=80=A6/Projekte/Linux/next2-patched/tools> LANG=3D=
C git apply =E2=80=A6/Projekte/Bau/Linux/scripts/Coccinelle/tuning1/next/2=
0260721/use_fputc.diff
error: patch failed: tools/bpf/bpftool/netlink_dumper.h:25
error: tools/bpf/bpftool/netlink_dumper.h: patch does not apply


Which implementation details should be reconsidered here for an affected m=
acro?
https://elixir.bootlin.com/linux/v7.2-rc4/source/tools/bpf/bpftool/netlink=
_dumper.h#L25

How will chances evolve to adjust more places according to remaining updat=
e candidates?

Regards,
Markus
