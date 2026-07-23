Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3360D4908DB;
	Thu, 23 Jul 2026 19:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784834787; cv=none; b=toW48dpr8dQfPnMVSfMdQq9/B4PqMKyPGh8CmzkwzwL3ZBDMEYpBU7AZHKnm+JiQdB0PKy4WToTzjzWYh20mQGstujLw0MmRDA17L0g43xA6zG01gXn6/POfS5ALAiVvY/5k7XvWJorDuJBrHXMK2L1EE94CYJGucAds0fUCNe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784834787; c=relaxed/simple;
	bh=+eGbDqgu88T0MsVknfqcw9TP3MK82P5mZo7JF6ZBeMY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mJS6KiXDCChw+NWGojVEyiEuYXVtXBX+EA+WXNCEhk2jGM4LTU75nAVnMCT4aQYm9S7giKIZS4CH0iwcqbBOZe4286RkudHblTw0TeR64cn061SpxEXBdHxFHC66u0ZkPwDDBjOmVJgWisXrODDHrjPb1f8UzD2zbUsPDCb4AVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=hze702Pi; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="hze702Pi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1784834776; x=1785439576; i=markus.elfring@web.de;
	bh=4CFDnU81eGJ4aIA2pJ+i439KKIKIofQhljvGQQb8tvc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hze702PiQWolQ1v1UUrSahJFBtEFwx7SgMrJ9JnIXeX+TYBNU3uBDjTPTlGo5QVG
	 FSORJK7bh+7MMwYYkOx1eZWFMVHn+8x9yIlpClF7RPHYydrDBPoQE5Ldotk4kkEt4
	 jHOcxlscpxScgV6SfiOB1DSYnbHEqX0KLw9bdLbOTMeBlWZ+m8e7igyOSFQIKzkeT
	 7dYPmoOgfia8Xx8stKHXkevc630Uhkb/DzRXmyJjP0k97LQZw95XJfFUUkQErfsaw
	 mZbELM7trNlpOTwZzCo+wYo3BBV+R3eHnaOc0FY423WRxd9ZJLU3VF09wAfLfDgTI
	 wU0QyqZcy7xBvhKKlw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N4N9I-1wwMwg2qTW-00uSiA; Thu, 23
 Jul 2026 21:26:16 +0200
Message-ID: <406093f5-ee7d-4ae9-808b-2b42d4846eab@web.de>
Date: Thu, 23 Jul 2026 21:26:15 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Improving output for single characters (with SmPL)?
From: Markus Elfring <Markus.Elfring@web.de>
To: cocci@inria.fr, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>
References: <202dfb21-f5a2-4550-8a1f-aa07d84db345@web.de>
Content-Language: en-GB, de-DE
In-Reply-To: <202dfb21-f5a2-4550-8a1f-aa07d84db345@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SGzef8a7BpBkZr51MR4xka0CKPBZ23+k2lsMFBSGPPR7bDJA6Dw
 kAw/Vhn1+fGSNrFliRX7/WV59S+XVFwmXprU4G9e9K066sgHV1cob2cgNh7aYuWncoz9E54
 VYKCztD8ep6u52U08qh9ecrdH0Cb0QgRxJyKITe/6ZF39HokY7lpUrNMAnwvADWkexJiKfD
 gANvQvuWjdAORkLLIPlMQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:afTUKe7Uts4=;hZGSOwQ4hY+/64/G8DGTFkGPUGL
 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
 =

> I would like to achieve further source code adjustments by the means of
> the following script variant for the semantic patch language.

Unfortunately, the SmPL code needs to be corrected a bit in the final
replacement rule.
The parameter order should be reversed from selected fprintf() to fputc() =
calls.

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
 (
-input_context
+text
 ,
-input_string
+input_context
 )
)


Another test result (according to the software combination =E2=80=9CCoccin=
elle 1.3.1=E2=80=9D):
Markus_Elfring@Sonne:=E2=80=A6/Projekte/Linux/next-analyses> time /usr/bin=
/spatch --timeout 23  -j4 --chunksize 1 --no-loops --include-headers -dir =
tools =E2=80=A6/Projekte/Coccinelle/janitor/use_fputc-20260723.cocci > =E2=
=80=A6/Projekte/Bau/Linux/scripts/Coccinelle/tuning1/next/20260721/use_fpu=
tc.diff
=E2=80=A6
548 files match
=E2=80=A6
real    0m35,324s
user    1m54,532s
sys     0m3,473s
Markus_Elfring@Sonne:/home/altes_Heim2/elfring/Projekte/Linux/next-analyse=
s> lsdiff /home/altes_Heim2/elfring/Projekte/Bau/Linux/scripts/Coccinelle/=
tuning1/next/20260721/use_fputc.diff | wc -l
50



I hope that demonstrated data processing possibilities can influence furth=
er
development ideas in constructive ways besides hints that some compilers
can also perform such a source code transformation already.

Regards,
Markus
