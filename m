Received: from o23.sg.zoom.us (o23.sg.zoom.us [159.183.150.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F2630BBB6
	for <kernel-janitors@vger.kernel.org>; Sun,  5 Apr 2026 17:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.183.150.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775409156; cv=none; b=pmNrx6K45M/pAvXItZ9kajvvomWfp6cpb7QX5X6TiqfNMJUwKUYaeUNbpPIUyDmjvuAtGAMxKEIfVM/cZ6q3WMoguLFVLMOiX56HDjKOeBWgkETWkfY7DNM5q/AxIgdQdXB6x+ygcfhHJuU/SRiWc555sGf5eV31/7CvCIZTabY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775409156; c=relaxed/simple;
	bh=d7iHBOK4RixvGtLcf80kDHlYChOC2nnIlzOerQ+28Rw=;
	h=Content-Type:Date:From:Mime-Version:Message-ID:Subject:To; b=O6CHO7YyrdZ65jrbDUkMj9qWszV0OW5ApSt705dHrkG/mxe/ipyJ2JEk39PVbNTnW+KiljPPro3FCeqJGrmUG8kLYQe6WkAMHTgm/RY/3/osIiqoyP7yA3NfSCUs79AQsIiSbMHSFdCx260rSTVOTSuTz7LkKic9OHOody872lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zoom.us; spf=pass smtp.mailfrom=bounce-sg.zoom.us; dkim=pass (2048-bit key) header.d=zoom.us header.i=@zoom.us header.b=dvYUdyyv; arc=none smtp.client-ip=159.183.150.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zoom.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce-sg.zoom.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zoom.us header.i=@zoom.us header.b="dvYUdyyv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zoom.us;
	h=content-type:date:from:mime-version:subject:reply-to:to:cc:
	content-type:date:from:subject:to;
	s=sg; t=1775409154; bh=x5Rp/xUOFtrJdQtc/eJHXeTWRctriXbnCOEpp9eZuj8=;
	b=dvYUdyyvRx4xuV5xL1ZDaAoF6u6qEFHBneA7Mnrv2JRS+tW5vqs3uEi1VnjGDALTxtXU
	hYSCrajRcmQYep5E/e1K6A77FWkHkq6o/87SdjPJRD7w/YFnmInAJi4xPkKtkpp4c0WuYf
	lnaOMAA+hVciMg/HSkBJ5/4gcBKqOADjkB15ewDbSt/cV1Ezgq4Dr5Bv8nwZC8om8e2elU
	ZBvUqL1Ot10ck7BGgIa+mJWIXc0iQzQkAQqGLbI1vxSkDGXpGTNIREzinHIu6f+5ivu1/0
	i5b7CFMGqb0LLGu2f6ARTdaUjgSUS34eAhoU9ijkl69sw/7kbJKWk0Q8Up0jfuXg==
Received: by recvd-6f779f9797-84ltm with SMTP id recvd-6f779f9797-84ltm-1-69D29802-60
	2026-04-05 17:12:34.677170359 +0000 UTC m=+504950.199175805
Received: from MjU5OTk1MjY (unknown)
	by geopod-ismtpd-106 (SG) with HTTP
	id 7X0GOQR9SoSpa5pwH0jJdQ
	Sun, 05 Apr 2026 17:12:34.671 +0000 (UTC)
Content-Type: multipart/mixed; boundary=798290529bb53624ca7d0797e28ae3aaf9683bb460ffed61761a10cf251a
Date: Sun, 05 Apr 2026 17:12:34 +0000 (UTC)
From: Zoom Webinar <no-reply@zoom.us>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <7X0GOQR9SoSpa5pwH0jJdQ@geopod-ismtpd-106>
Subject: Discover How To Instantly Rank On Top Of Every Search From Google
 Rankings To AI Discovery In ChatGPT, Gemini, Claude, Perplexity, & Copilot
 Confirmation
Reply-To: Zoom Webinar <sanryarries@cheems.baby>
Feedback-ID: N22xJtKJSxKwfWS3SRg6HA:::zoom.us
X-SG-EID: 
 =?us-ascii?Q?u001=2ERgZnWCz8IFHH0kIZpn+qAiw7pwkTVFI=2FJtjtfe++gnUbGuPWuWXXvMnuq?=
 =?us-ascii?Q?lWvvHeZe7tGaFmya1Lib5mab1OpH1khLXfhz6Pj?=
 =?us-ascii?Q?3IqSrnk2KuJiYiga1yFAN0VPct4dV1AgYJd8ecU?=
 =?us-ascii?Q?eENVOUMP4+OdjUxF5HUhvcfhs2IQR6nj4OwvVqW?=
 =?us-ascii?Q?jQaVrwbRJmVjffan5Ms9ltkF6NdeTvMfcqa0RGc?=
 =?us-ascii?Q?w43ZMnUOXIUm9yvXPdUrUfJwEAaJ9xCj4FJuiFY?= =?us-ascii?Q?8gLM?=
X-SG-ID: 
 =?us-ascii?Q?u001=2ESdBcvi+Evd=2FbQef8eZF3Bq+efGylwbz3q5X9xSK9XHyEixZMkOa8ilCgx?=
 =?us-ascii?Q?YOwpsXED6=2FoRQgRpyNwhJCp+NbSG4xP8sPpKkrO?=
 =?us-ascii?Q?K4yJNq1xr82QviQxGE14CPOuJjyZCJ7dRc8TPA=2F?=
 =?us-ascii?Q?5=2Fb366Dj6QxFXh0k+1dyiPtlQGTSxIwGk1+NTj8?=
 =?us-ascii?Q?uFX+JzVVIBxIrh0Y=2FP=2FbMIE6o=2FHo051KHezaVsg?=
 =?us-ascii?Q?1SKoHsPXCwNbkD8AV8SuFfO=2FLfWE0KXSXDQAQ1S?=
 =?us-ascii?Q?haYfH0oLas6AaVNAcLnznanLFQgnekqHPip8lDv?=
 =?us-ascii?Q?ayZh+fJrVDiym2=2FARC5Sf6uBK=2FUK0zJ5zgl=2FYLF?=
 =?us-ascii?Q?w5iDTZj8Bdae3+dABRaIgjNYnAxAVXLeBMxTQuf?=
 =?us-ascii?Q?MtFXhcEc3yIVzDF48MEzqpsJ2H8a7a2Xl3SuIdF?=
 =?us-ascii?Q?FWTKwlXnxlkZ44rIPQwSkcy3kfS2dIGe8yEsRc0?=
 =?us-ascii?Q?w2uVdtJJuTZUj19h75dAlCefUnwnNERtcpdblTq?=
 =?us-ascii?Q?1zbrQ17OzikaLS3eRcYS7XzOU8faX6LWeS86Pnh?=
 =?us-ascii?Q?H5=2FaMoC0eQ5hs9PLVedmJt9Nh3vgtvX9ensvjr2?=
 =?us-ascii?Q?yd9EYtB5AydBPsUyAIOIj9hCZS7NDrTZv3qhCZj?=
 =?us-ascii?Q?2iBCjpyLfsDqjnBVbbtxpYlZwyNyBccQtG5kMDj?=
 =?us-ascii?Q?bcnXC8OdbNKiZvc3ucUQ8M9u3LFgHIacjoFq+FJ?=
 =?us-ascii?Q?o5sMauQOgp+XqcrkIqm3l4hrWEzg9hm4zP9=2F7CG?=
 =?us-ascii?Q?phcKMyE+F0pnZqDGUwHMZLfL1Gj4T7vMt=2FT6vAW?=
 =?us-ascii?Q?xThZzH8XwraQ+BEg2p1LjIQCVSIPU=2FQF0d3gUqd?=
 =?us-ascii?Q?5SK4xt6ONHZB48+OSgzbA2ssyoUGEpGXJsRcDVE?=
 =?us-ascii?Q?JkmJVSYqoObLP174EXk7v4cGDGqWq8YDDKwyvip?=
 =?us-ascii?Q?jIzuw31Ll=2FprGwHh+sEdhcoqQm7+q5zxeNWHVNw?=
 =?us-ascii?Q?9tU7iUuYvxT=2Fo+4vT+GjlTjZuJz3vgRXEbe53VI?=
 =?us-ascii?Q?owwkD453A4prp4ff0ql8+Ds94IP2dCyV0qC6=2F5p?=
 =?us-ascii?Q?zu=2FtAmAMmQbYRV+H+ts8UYkIAhf0oxvW=2FsWWQQi?=
 =?us-ascii?Q?in20vXID9Z1UyI6KdVbVFIBVC6cI2vHSB+9JujU?=
 =?us-ascii?Q?1tSIkBLM=2FwI1n164s?=
To: kernel-janitors@vger.kernel.org
X-Entity-ID: u001.2o4x06M7TQXGOcDa9LFkMA==

--798290529bb53624ca7d0797e28ae3aaf9683bb460ffed61761a10cf251a
Content-Type: multipart/alternative; boundary=fbc950d0c566def4ca1e134e5d97093ee94bfabb8bf25dfbf833f11cb522

--fbc950d0c566def4ca1e134e5d97093ee94bfabb8bf25dfbf833f11cb522
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8
Mime-Version: 1.0

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.=
w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=3D"http://www.w3.org/1999/xhtml">
<head>
    <meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Type=
"/>
</head>
<body style=3D"height: 100% !important;width: 100% !important;margin: 0;pad=
ding: 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" align=3D"center" bg=
color=3D"#f1f1f4" width=3D"100%" style=3D"font-size: 13px;font-family: Aria=
l;height:100%;">
    <tr>
        <td>
            <table id=3D"table-new-invitation" border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0" align=3D"center" style=3D"padding: 40px 0;max-width: 9=
60px;min-width: 600px;width: 60%;">
                    <tr><td style=3D"height: 8px;"></td> </tr>
                <tr>
                    <td valign=3D"top" bgcolor=3D"#ffffff">
                        <table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" align=3D"center" width=3D"100%" style=3D"margin-left: 0;margin-right=
: 0;">
                            <tr>
                                <td style=3D"padding-left: 32px;padding-rig=
ht: 32px;">
                                    <table border=3D"0" cellpadding=3D"0" c=
ellspacing=3D"0" align=3D"center" width=3D"100%" style=3D"font-size: 13px;c=
olor: #39394d;font-family: Arial;">
                                        <tr> <td colspan=3D"2" valign=3D"to=
p" style=3D"padding-top:32px;font-size: 14px;font-weight: 400;color: #13161=
9;font-family: Arial;line-height: 24px;">Hi  kernel-janitors@vger<span>.</s=
pan>kernel<span>.</span>org,</td> </tr>
                                        <tr> <td colspan=3D"2" valign=3D"to=
p" style=3D"padding-top:32px;font-size: 14px;font-weight: 400;color: #13161=
9;font-family: Arial;line-height: 24px;">Thank you for registering for Disc=
over How To Instantly Rank On Top Of Every Search From Google Rankings To A=
I Discovery In ChatGPT, Gemini, Claude, Perplexity, &amp; Copilot. You can =
find information about this webinar below.</td> </tr>
                                        <tr><td style=3D"height: 32px"></td=
></tr>
                                            <tr> <td colspan=3D"2" valign=
=3D"top" style=3D"padding-bottom: 8px;height:auto;font-size: 14px;font-weig=
ht: 400;color: #131619;font-family: Arial;line-height: 24px;"> BONUS: Get T=
he World&#39;s First AI Agent That Builds, Runs &amp; Monetizes A Complete =
Faceless YouTube Channel. Press ONE Button=E2=80=A6 And Watch ChannelAgent =
Research Your Niche, Write Your Scripts, Record Your Voiceovers, Create 10-=
50 Videos at go, Design Your Thumbnails, Handle Your SEO, Upload To YouTube=
, AND Monetize Everything=E2=80=A6 All On Complete Autopilot. Click here ht=
tps://lik.wiki/get-y0utube-payments<br><br>NOTE: If you don&#39;t want futu=
re invitation to our special trainings kindly send an email with the subjec=
t &quot;END&#39;&#39; to adah43397@gmail.com </td> </tr>
                                        <tr><td style=3D"height: 32px"></td=
></tr>
                                            <tr> <td colspan=3D"2" valign=
=3D"top" style=3D"font-size: 14px;font-weight: 400;color: #131619;font-fami=
ly: Arial;line-height: 24px;"> Please submit any questions to: <a target=3D=
"_blank" style=3D"color: #000000;text-decoration:none;"> sanryarries@cheems=
.baby</a> </td> </tr>
                                        <tr><td style=3D"height: 32px"></td=
></tr>
                                            <tr> <td colspan=3D"2" style=3D=
"font-size: 14px;font-weight: 400;color: #000;font-family: Arial;line-heigh=
t: 24px;" valign=3D"top"> You can <a href=3D"https://us06web.zoom.us/webina=
r/register/WN_XX_nL7sISOu84_gZN3aKLg?tk=3DeV36fzKcFmcSqU6MHzcg0Z5qp2fOo7-kn=
rseRqcusBg.DQkAAAAUjy2STBZ0NEs2MUpQZlNqU0QtQ3owdTc3YlhRAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAA#detail" target=3D"_blank">cancel</a> your registrat=
ion at any time. </td> </tr>
                                        <tr><td style=3D"height: 32px"></td=
></tr>
                                        <tr> <td colspan=3D"2" style=3D"fon=
t-size: 14px;font-weight: 400;color: #000;font-family: Arial;line-height: 2=
4px;" valign=3D"top"> Thank you! </td> </tr>
                                        <tr>
                                            <td width=3D"100%">
                                                <table style=3D"width:100%;=
border-radius: 8px;background-color: #F7F7FC;">
                                                        <tr> <td colspan=3D=
"3" style=3D"padding: 12px 16px 8px 16px;font-size: 14px;font-weight: 700;l=
ine-height: 24px;" valign=3D"top">  <strong>Discover How To Instantly Rank =
On Top Of Every Search From Google Rankings To AI Discovery In ChatGPT, Gem=
ini, Claude, Perplexity, &amp; Copilot</strong> </td> </tr>
                                                            <tr>
                                                                <td valign=
=3D"top" style=3D"padding: 4px 16px 8px 16px;width: 112px;font-size: 13px;f=
ont-weight: 400;line-height: 16px;color: rgba(4, 4, 19, 0.56);">Date & Time=
</td>
                                                                <td valign=
=3D"top" style=3D"font-weight: 400;font-size: 13px;line-height: 16px;color:=
 #233333;padding: 4px 16px 8px 0;">Apr 5, 2026 03:00 PM Eastern Time (US an=
d Canada)</td>
                                                            </tr>
                                                        <tr>
                                                            <td valign=3D"t=
op" style=3D"padding: 4px 16px 8px 16px;width: 112px;font-size: 13px;font-w=
eight: 400;line-height: 16px;color: rgba(4, 4, 19, 0.56);">Webinar ID</td>
                                                            <td valign=3D"t=
op" style=3D"font-weight: 400;font-size: 13px;line-height: 16px;color: #233=
333;padding: 4px 16px 8px 0;">883 0147 4380</td>
                                                        </tr>
                                                        <tr>
                                                            <td valign=3D"t=
op" style=3D"padding: 4px 16px 8px 16px;width: 112px;font-size: 13px;font-w=
eight: 400;line-height: 16px;color: rgba(4, 4, 19, 0.56);">Passcode</td>
                                                            <td valign=3D"t=
op" style=3D"font-weight: 400;font-size: 13px;line-height: 16px;color: #233=
333;padding: 4px 16px 8px 0;">620874</td>
                                                        </tr>
                                                        <tr>
                                                            <td valign=3D"t=
op" style=3D"padding: 4px 16px 8px 16px;width: 112px;font-size: 13px;font-w=
eight: 400;line-height: 16px;color: rgba(4, 4, 19, 0.56);">Description</td>
                                                            <td valign=3D"t=
op" style=3D"font-weight: 400;font-size: 13px;line-height: 16px;color: #233=
333;padding: 4px 16px 8px 0;">BONUS: Get The World&#39;s First AI Agent Tha=
t Builds, Runs &amp; Monetizes A Complete Faceless YouTube Channel. Press O=
NE Button=E2=80=A6 And Watch ChannelAgent Research Your Niche, Write Your S=
cripts, Record Your Voiceovers, Create 10-50 Videos at go, Design Your Thum=
bnails, Handle Your SEO, Upload To YouTube, AND Monetize Everything=E2=80=
=A6 All On Complete Autopilot. Click here https://lik.wiki/get-y0utube-paym=
ents<br/>
<br/>
NOTE: If you don&#39;t want future invitation to our special trainings kind=
ly send an email with the subject &quot;END&#39;&#39; to adah43397@gmail.co=
m</td>
                                                        </tr>
                                                    <tr>
                                                        <td style=3D"paddin=
g: 8px 16px 0;width: 112px;"></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr><td style=3D"height: 8px;"></td=
> </tr>
                                            <tr> <td colspan=3D"2" style=3D=
"line-height: 32px;padding-top: 16px;padding-bottom: 30px;"> <span style=3D=
"font-size: 14px;font-weight: bold;line-height: 20px;color: #222230;vertica=
l-align: middle;">Add to:</span>  <a href=3D"https://us06web.zoom.us/webina=
r/tZwud-isqT8pEtT8kTChlhXwKmffveEDtb55/calendar/google/add?user_id=3Du_9HZA=
UXiqZ6EWELsxB1XsZsKKwzeIl89QL3HJVOh-tnxkwTRkg.zaOFlAo7ZCqF9Cs_&type=3Dgoogl=
e" style=3D"letter-spacing: 0;border: 1px solid #3171BB;color: #3171BB;bord=
er-radius: 8px;padding: 3px 5px;text-decoration: none;font-weight: 400;font=
-size: 14px;line-height: 30px;height: 24px;display:inline-flex;vertical-ali=
gn:middle;"> <i class=3D"glyphicon" style=3D"width: 20px;display:inline-blo=
ck;"> <img src=3D"https://us06st3.zoom.us/static/6.3.55196/image/new/google=
.png" /> </i><span style=3D"display:inline-flex;line-height:24px;">&nbsp;Go=
ogle Calendar</span> </a>&nbsp;  <a href=3D"https://us06web.zoom.us/webinar=
/tZwud-isqT8pEtT8kTChlhXwKmffveEDtb55/ics?user_id=3Dj6M8Efn8qLHjOuckB36zBYr=
6KUh6kdazDLJyawSV_CmJMca1xvw.yT-U8s7Ss0OHZdHU&type=3Dicalendar" style=3D"bo=
rder: 1px solid #0E72ED;color: #0E72ED;border-radius: 8px;padding:3px 5px;t=
ext-decoration: none;font-weight: 400;font-size: 14px;line-height: 30px;ver=
tical-align:middle;height: 24px;display:inline-flex;letter-spacing: 0;"> <i=
 class=3D"glyphicon" style=3D"width: 20px;display:inline-block;"> <img src=
=3D"https://us06st3.zoom.us/static/6.3.55196/image/new/outlook.png" /> </i>=
<span style=3D"display:inline-flex;line-height:24px;">&nbsp;Outlook Calenda=
r(.ICS)</span> </a>&nbsp; <a href=3D"https://us06web.zoom.us/webinar/tZwud-=
isqT8pEtT8kTChlhXwKmffveEDtb55/ics?user_id=3DjjWleYxaSUHB57ipbH9ZCYOsy632T5=
OsmWYyjlFtyZZ3HNRylA0.nbANh0JBB8pvK-D5&type=3Dyahoo" style=3D"border: 1px s=
olid #952BCE;color: #952BCE;border-radius: 8px;padding: 3px 5px;text-decora=
tion: none;font-weight: 400;font-size: 14px;line-height: 30px;vertical-alig=
n:middle;height: 24px;display:inline-flex;letter-spacing: 0;"> <i class=3D"=
glyphicon" style=3D"width: 20px;display:inline-block;"> <img src=3D"https:/=
/us06st3.zoom.us/static/6.3.55196/image/new/yahoo.png" /> </i><span style=
=3D"display:inline-flex;line-height:24px;">&nbsp;Yahoo Calendar</span> </a>=
 </td> </tr>
                                        <tr></tr>
                                        <tr> <td> <table align=3D"left" cel=
lpadding=3D"0" cellspacing=3D"0" style=3D"width:100%;"> <tr> <td bgcolor=3D=
"#ffffff" style=3D"padding: 32px 0 0 0;padding-top: 30px !important;width: =
182px;font-size: 12px;line-height: 18px;color: rgba(4, 4, 19, 0.56);font-we=
ight: 700;" valign=3D"top"> WAYS TO JOIN THIS WEBINAR </td> <td bgcolor=3D"=
#ffffff" style=3D"padding: 32px 0 0 8px;padding-top: 38px !important;" vali=
gn=3D"top"> <div style=3D"height: 1px;border-top: 1px dashed rgba(82, 82, 1=
28, 0.18);"></div> </td> </tr> </table> </td> </tr>
                                        <tr> <td colspan=3D"2" style=3D"pad=
ding-left:12px;padding-top: 28px !important;padding-bottom: 12px !important=
;font-family: Arial;font-size: 16px;font-weight: 700;line-height: 24px;colo=
r: #233333;" valign=3D"top"> <ul style=3D"padding:0;margin:0;"><li class=3D=
"join1" style=3D"margin-left:0;list-style-type: disc;">Join from PC, Mac, i=
Pad, or Android</li></ul> </td> </tr>
                                            <tr> <td bgcolor=3D"#ffffff" wi=
dth=3D"122" height=3D"30" style=3D"padding-bottom: 16px;" valign=3D"middle"=
> <div style=3D"height: 24px;border-radius: 8px;line-height: 30px;mso-line-=
height-rule: exactly;"> <a type=3D"button" href=3D"https://us06web.zoom.us/=
w/88301474380?tk=3DeV36fzKcFmcSqU6MHzcg0Z5qp2fOo7-knrseRqcusBg.DQkAAAAUjy2S=
TBZ0NEs2MUpQZlNqU0QtQ3owdTc3YlhRAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
&pwd=3DpXWLcjEPli4qoHjpmE6NdMLS1IwIMQ.1&uuid=3DWN_XX_nL7sISOu84_gZN3aKLg" t=
arget=3D"_blank" style=3D"height:24px;text-decoration:none;font-size: 14px;=
font-weight: 500;color: #fff;background: #0E72ED;border-radius: 8px;line-he=
ight: 30px;vertical-align:middle;padding: 7px 20px;mso-line-height-rule:exa=
ctly;">&nbsp;&nbsp;&nbsp;&nbsp;<span style=3D"line-height:30px;mso-line-hei=
ght-rule:exactly;">Join Webinar</span>&nbsp;&nbsp;&nbsp;&nbsp;</a> </div> <=
/td> </tr>
                                            <tr> <td colspan=3D"2" valign=
=3D"top" style=3D"font-size: 14px;font-weight: 400;color: #000000;font-fami=
ly: Arial;line-height: 24px;"> If the button above does not work, paste thi=
s into your browser:=E2=80=A8<br/> </td> </tr>
                                            <tr> <td colspan=3D"2" valign=
=3D"top" width=3D"536" style=3D"word-break: break-all;font-size: 14px;font-=
weight: 400;color: #000000;font-family: Arial;line-height: 24px;"> <a href=
=3D"https://us06web.zoom.us/w/88301474380?tk=3DeV36fzKcFmcSqU6MHzcg0Z5qp2fO=
o7-knrseRqcusBg.DQkAAAAUjy2STBZ0NEs2MUpQZlNqU0QtQ3owdTc3YlhRAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAA&pwd=3DpXWLcjEPli4qoHjpmE6NdMLS1IwIMQ.1&uuid=3D=
WN_XX_nL7sISOu84_gZN3aKLg" style=3D"width: 536px;text-decoration:underline;=
color: #000000;word-wrap:break-word;">https://us06web.zoom.us/w/88301474380=
?tk=3DeV36fzKcFmcSqU6MHzcg0Z5qp2fOo7-knrseRqcusBg.DQkAAAAUjy2STBZ0NEs2MUpQZ=
lNqU0QtQ3owdTc3YlhRAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&pwd=3DpXWLcj=
EPli4qoHjpmE6NdMLS1IwIMQ.1&uuid=3DWN_XX_nL7sISOu84_gZN3aKLg</a> </td> </tr>
                                        <tr> <td colspan=3D"2" style=3D"fon=
t-family: Arial;font-size: 14px;font-weight: 700;line-height: 17px;color: #=
222230;padding-top: 12px;" valign=3D"top"> To keep this webinar secure, do =
not share this link publicly. </td> </tr>
                                                <tr>
                                                    <td width=3D"100%">
                                                        <table align=3D"lef=
t" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"width:auto;pad=
ding:0;margin:0;">
                                                            <tr> <td colspa=
n=3D"2" valign=3D"top" style=3D"padding:32px 0 8px 12px;font-family: Arial;=
font-size: 16px;font-weight: 700;line-height: 24px;color: #233333;"> <ul st=
yle=3D"padding:0;margin:0;"><li style=3D"margin-left:0;list-style-type: dis=
c;">Join via audio</li></ul> </td> </tr>
                                                            <tr> <td width=
=3D"600" colspan=3D"2" valign=3D"top" style=3D"word-break: break-word;paddi=
ng-bottom: 4px;font-size: 14px;font-weight: 400;color: #233333;font-family:=
 Arial;line-height: 24px;"> <span style=3D"color: #000000;word-wrap: break-=
word;"> US: <a style=3D"color: #233333;text-decoration: underline;" href=3D=
"tel:+16469313860,,88301474380#">+16469313860,,88301474380#</a>   or <a sty=
le=3D"color: #233333;text-decoration: underline;" href=3D"tel:+16694449171,=
,88301474380#">+16694449171,,88301474380#</a>  </span> </td> </tr>
                                                            <tr> <td style=
=3D"width: 100px;padding-left: 0;padding-right: 6px;font-weight: 600;font-s=
ize: 14px;color: #233333;font-family: Arial;line-height: 24px;" valign=3D"t=
op"> Or, dial: </td> <td width=3D"836" style=3D"word-break: break-word;padd=
ing-left: 0;padding-bottom: 4px;font-size: 14px;font-weight: 400;color: #23=
3333;font-family: Arial;line-height: 24px;" valign=3D"top"> <span style=3D"=
color: #000000;word-wrap: break-word;">    US:  +1 646 931 3860      or +1 =
669 444 9171      or +1 669 900 6833      or +1 689 278 1000      or +1 719=
 359 4580      or +1 253 205 0468      or +1 253 215 8782      or +1 301 71=
5 8592      or +1 305 224 1968      or +1 309 205 3325      or +1 312 626 6=
799      or +1 346 248 7799      or +1 360 209 5623      or +1 386 347 5053=
      or +1 507 473 4847      or +1 564 217 2000      or +1 646 558 8656   =
  <br><a href=3D"https://us06web.zoom.us/u/kdkwhB46zb" target=3D"_blank" st=
yle=3D"font-size: 14px;font-weight: 400;color: #233333;font-family: Arial;l=
ine-height: 24px;vertical-align: top;">More International numbers</a>  </sp=
an> </td> </tr>
                                                                <tr> <td va=
lign=3D"top" style=3D"width: auto;padding-left: 0;padding-right: 6px;font-s=
ize: 14px;font-weight: 400;color: #233333;font-family: Arial;line-height: 2=
4px;">Webinar ID:</td> <td style=3D"padding-left:0;padding-bottom: 4px;font=
-size: 14px;font-weight: 400;color: #233333;font-family: Arial;line-height:=
 24px;" valign=3D"top">883 0147 4380</td> </tr>
                                                                <tr> <td va=
lign=3D"top" style=3D"width: auto;padding-left: 0;padding-right: 6px;font-s=
ize: 14px;font-weight: 400;color: #233333;font-family: Arial;line-height: 2=
4px;"> Passcode: </td> <td style=3D"padding-left:0;padding-bottom: 4px;font=
-size: 14px;font-weight: 400;color: #233333;font-family: Arial;line-height:=
 24px;" valign=3D"top"> 620874 </td> </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                        <tr><td colspan=3D"2" style=3D"font=
-size: 14px;font-weight: 400;color: #233333;font-family: Arial;line-height:=
 24px;" valign=3D"top">BONUS: Get The World&#39;s First AI Agent That Build=
s, Runs &amp; Monetizes A Complete Faceless YouTube Channel. Press ONE Butt=
on=E2=80=A6 And Watch ChannelAgent Research Your Niche, Write Your Scripts,=
 Record Your Voiceovers, Create 10-50 Videos at go, Design Your Thumbnails,=
 Handle Your SEO, Upload To YouTube, AND Monetize Everything=E2=80=A6 All O=
n Complete Autopilot. Click here https://lik.wiki/get-y0utube-payments<br><=
br>NOTE: If you don&#39;t want future invitation to our special trainings k=
indly send an email with the subject &quot;END&#39;&#39; to adah43397@gmail=
.com</td></tr>
                                       =20
                                       =20
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height=3D"32"></td>
                            </tr>
                            <tr><td style=3D"padding-top: 32px;padding-left=
: 32px;padding-right: 32px;"><div style=3D"height: 1px; border-top-width: 1=
px; border-top-style: inset; border-top-color: #DFE3E8;"></div></td></tr>
                            <tr>
                                <td style=3D"padding-top: 24px;padding-bott=
om: 24px;">
                                    <table align=3D"center" border=3D"0" ce=
llpadding=3D"0" cellspacing=3D"0" style=3D"width:auto;">
                                        <tbody>
                                        <tr>
                                            <td style=3D"padding:0;"> <a hr=
ef=3D"https://linkedin.com/company/zoom/" class=3D"no-decortaion" style=3D"=
margin-right: 16px;"> <img alt=3D"" border=3D"0" width=3D"32" height=3D"32"=
 src=3D"https://file-paa.zoom.us/kNH2urxhRLqXnWNb_EN1lQ/MS4yLoS79VBM36fz9x0=
Qu-Vm3_05uKEgidDZkSkBh6nf5jHh/Linkedin.png" style=3D"border-width: 0px;bord=
er-style: solid;width: 32px;height: 32px;" /> </a> </td>
                                            <td style=3D"padding:0;"> <a hr=
ef=3D"https://twitter.com/zoom" class=3D"no-decortaion" style=3D"margin-rig=
ht: 16px;"> <img alt=3D"" border=3D"0" width=3D"32" height=3D"32" src=3D"ht=
tps://file-paa.zoom.us/A9z6enYnRciVty2WD69K5Q/MS4yLlA3EEXVxtd5BnQvHzaVmWfiw=
_MyODrLSm1FTgct1k_x/X.png" style=3D"border-width: 0px;border-style: solid;w=
idth: 32px;height: 32px;" /> </a> </td>
                                            <td style=3D"padding:0;"> <a hr=
ef=3D"https://instagram.com/zoom" class=3D"no-decortaion" style=3D"margin-r=
ight: 16px;"> <img alt=3D"" border=3D"0" width=3D"32" height=3D"32" src=3D"=
https://file-paa.zoom.us/6OcdBBJUSUO39GlRevwBpw/MS4yLhjC22e6R_ad3qd4NWLCKth=
WlIu8Y716iX4jSiBD42Rx/Instagram.png" style=3D"border-width: 0px;border-styl=
e: solid;width: 32px;height: 32px;" /> </a> </td>
                                            <td style=3D"padding:0;"> <a hr=
ef=3D"https://www.facebook.com/zoom" style=3D"text-decoration: none;margin-=
right: 16px;"> <img alt=3D"" border=3D"0" width=3D"32" height=3D"32" src=3D=
"https://file-paa.zoom.us/XiUNdDxVRN227pWtZejqng/MS4yLjBX8SUlVoub9cJv-VllS5=
alt7U-cZRNnpyJTwbWNBPX/Facebook.png" style=3D"border-width: 0px;border-styl=
e: solid;width: 32px;height: 32px;" /> </a> </td>
                                            <td style=3D"padding:0;"> <a hr=
ef=3D"https://www.youtube.com/@Zoom" style=3D"text-decoration: none;margin-=
right: 16px;"> <img alt=3D"" border=3D"0" width=3D"32" height=3D"32" src=3D=
"https://file-paa.zoom.us/AQII00caTNmcRtOxZA9CHw/MS4yLluoNlumbwBzheCXQU4wTL=
FvBAvxtt0j2Se_SPtGrimT/YouTube.png" style=3D"border-width: 0px;border-style=
: solid;width: 32px;height: 32px;" /> </a> </td>
                                            <td style=3D"padding:0;"> <a hr=
ef=3D"https://blog.zoom.us/" style=3D"text-decoration: none;"> <img alt=3D"=
" border=3D"0" width=3D"32" height=3D"32" src=3D"https://file-paa.zoom.us/y=
3B837SCRhewJhRfIQAbNQ/MS4yLjSNE-R1r6XOy5Splz-i8Kl5uvaFt1JIWRutwY3W9uAP/Blog=
.png" style=3D"border-width: 0px;border-style: solid;width: 32px;height: 32=
px;" /> </a> </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <table align=3D"center" border=3D"0" ce=
llpadding=3D"0" cellspacing=3D"0" width=3D"100%" style=3D"margin-top: 16px;=
color:#6E7680;font-size: 12px;line-height: 16px;font-weight: 400;">
                                        <tbody>
                                        <tr> <td align=3D"center" style=3D"=
font-size:12px;font-weight: 400;line-height:16px;color:#747487;" valign=3D"=
top"> <a style=3D"color: #0D6BDE; font-size: 14px;font-style: normal;font-w=
eight: 590;line-height: 18px;text-decoration:none; letter-spacing: -0.15px;=
">Zoom.com</a> <br> <a style=3D"color: #2A2B2D; font-size: 10px; font-style=
: normal;font-weight: 400;line-height: 16px;text-decoration:none; letter-sp=
acing: 0.12px;" target=3D"_blank"> 55 Almaden Blvd<br> San Jose, CA 95113</=
a> </td> </tr>
                                        <tr> <td align=3D"center"style=3D"p=
adding: 16px 0 0;font-size:12px;font-weight: 400;line-height:16px;color:#74=
7487;" valign=3D"top"> <a href=3D"tel:1-888-799-9666" style=3D"color: #0D6B=
DE; text-decoration: none; font-size: 14px; font-style: normal;font-weight:=
 590;line-height: 18px; letter-spacing: -0.15px;">+1.888.799.9666</a> <br> =
</td> </tr>
                                        <tr> <td align=3D"center"style=3D"f=
ont-size:12px;font-weight: 400;line-height:16px;color:#747487;" valign=3D"t=
op"> <a style=3D"color:#686F79;margin:0;font-size:10px; font-weight: 400;li=
ne-height: 16px;text-decoration: none; letter-spacing: 0.12px;" target=3D"_=
blank">&copy;2026 Zoom Communications, Inc.</a> <br> </td> </tr>
                                        </tbody>
                                    </table>

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>

<html xmlns=3D"http://www.w3.org/1999/xhtml">
<head>
    <meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Type=
"/>
</head>
<body style=3D"height: 100% !important;width: 100% !important;margin: 0;pad=
ding: 0;">
            <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspac=
ing=3D"0" width=3D"100%" style=3D"padding-top: 16px;">
            <tbody>
                <tr>
                    <td align=3D"center" style=3D"padding-top:16px;padding-=
left: 32px;padding-right: 32px;color:#6e7680;font-size:18px;line-height:22p=
x;font-weight:400" valign=3D"top">
                        <a style=3D"color:#6E7680;text-decoration: none;" t=
arget=3D"_blank">
                            To unsubscribe, [<a href=3D'https://us06web.zoo=
m.us/webinar/email/4f6a35f2-e97b-4fd9-ad20-bac1ad572f71/unsubscribe?email=
=3DDBeapJG5i8P-3nlm4QAAHwAAAI18FUtY5emwL4ycdpNYb8w0-e5lZvCXnC3VwSUvpuwbO0vy=
L1YNl7sGw-2jUZdQMDAwMDAx&amp;host=3DDOkVaTGKG7K4zymC3AAAFwAAAEqPPVzoaGXzngz=
wIJuP6Ie5mUVS8YDjywLttrec5HEyBfiy0LnSRDAwMDAwMQ&amp;language=3Den-US&amp;vi=
ew=3Dfalse'>Click here</a>]
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
</body>
</html>
--fbc950d0c566def4ca1e134e5d97093ee94bfabb8bf25dfbf833f11cb522
Content-Transfer-Encoding: quoted-printable
Content-Type: text/calendar; method=REQUEST;; charset=UTF-8
Mime-Version: 1.0

BEGIN:VCALENDAR
PRODID:-//zoom.us//iCalendar Event//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VTIMEZONE
TZID:America/New_York
LAST-MODIFIED:20260306T231828Z
TZURL:https://www.tzurl.org/zoneinfo-outlook/America/New_York
X-LIC-LOCATION:America/New_York
BEGIN:DAYLIGHT
TZNAME:EDT
TZOFFSETFROM:-0500
TZOFFSETTO:-0400
DTSTART:19700308T020000
RRULE:FREQ=3DYEARLY;BYMONTH=3D3;BYDAY=3D2SU
END:DAYLIGHT
BEGIN:STANDARD
TZNAME:EST
TZOFFSETFROM:-0400
TZOFFSETTO:-0500
DTSTART:19701101T020000
RRULE:FREQ=3DYEARLY;BYMONTH=3D11;BYDAY=3D1SU
END:STANDARD
END:VTIMEZONE
BEGIN:VEVENT
DTSTAMP:20260405T162247Z
DTSTART;TZID=3DAmerica/New_York:20260405T150000
DTEND;TZID=3DAmerica/New_York:20260405T160000
SUMMARY:Discover How To Instantly Rank On Top Of Every Search From Google Ra=
nkings To AI Discovery In ChatGPT\, Gemini\, Claude\, Perplexity\, & Copilot
UID:b97kuj9o70pj0c9k6sq36e1gddin4rj5dgmmkobed5q6usjj81r6epbi5plmasjeclm2srri=
cs
TZID:America/New_York
DESCRIPTION:Topic: Discover How To Instantly Rank On Top Of Every Search Fro=
m Google Rankings To AI Discovery In ChatGPT\, Gemini\, Claude\, Perplexity\=
, & Copilot\nDescription: BONUS: Get The World's First AI Agent That Builds\=
, Runs & Monetizes A Complete Faceless YouTube Channel. Press ONE Button=E2=
=80=A6 And Watch ChannelAgent Research Your Niche\, Write Your Scripts\, Rec=
ord Your Voiceovers\, Create 10-50 Videos at go\, Design Your Thumbnails\, H=
andle Your SEO\, Upload To YouTube\, AND Monetize Everything=E2=80=A6 All On=
 Complete Autopilot. Click here https://lik.wiki/get-y0utube-payments\n\nNOT=
E: If you don't want future invitation to our special trainings kindly send =
an email with the subject "END'' to adah43397@gmail.com\n\nJoin from PC\, Ma=
c\, iPad\, or Android:\nhttps://us06web.zoom.us/w/88301474380?tk=3DeV36fzKcF=
mcSqU6MHzcg0Z5qp2fOo7-knrseRqcusBg.DQkAAAAUjy2STBZ0NEs2MUpQZlNqU0QtQ3owdTc3Y=
lhRAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&pwd=3DpXWLcjEPli4qoHjpmE6NdML=
S1IwIMQ.1&uuid=3DWN_XX_nL7sISOu84_gZN3aKLg\nPasscode:620874\n\nPhone one-tap=
:\n+16469313860\,\,88301474380#\,\,\,\,*620874# US\n+16694449171\,\,88301474=
380#\,\,\,\,*620874# US\n\nJoin via audio:\n+1 646 931 3860 US\n+1 669 444 9=
171 US\n+1 669 900 6833 US (San Jose)\n+1 689 278 1000 US\n+1 719 359 4580 U=
S\n+1 253 205 0468 US\n+1 253 215 8782 US (Tacoma)\n+1 301 715 8592 US (Wash=
ington DC)\n+1 305 224 1968 US\n+1 309 205 3325 US\n+1 312 626 6799 US (Chic=
ago)\n+1 346 248 7799 US (Houston)\n+1 360 209 5623 US\n+1 386 347 5053 US\n=
+1 507 473 4847 US\n+1 564 217 2000 US\n+1 646 558 8656 US (New York)\nWebin=
ar ID: 883 0147 4380\nPasscode: 620874\nInternational numbers available: htt=
ps://us06web.zoom.us/u/kdkwhB46zb\n\n\n
LOCATION:https://us06web.zoom.us/w/88301474380?tk=3DeV36fzKcFmcSqU6MHzcg0Z5q=
p2fOo7-knrseRqcusBg.DQkAAAAUjy2STBZ0NEs2MUpQZlNqU0QtQ3owdTc3YlhRAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&pwd=3DpXWLcjEPli4qoHjpmE6NdMLS1IwIMQ.1&uuid=
=3DWN_XX_nL7sISOu84_gZN3aKLg
SEQUENCE:1775405209
ORGANIZER;ROLE=3DREQ-PARTICIPANT;CN=3DZoom Webinar:no-reply@zoom.us
ATTENDEE;ROLE=3DREQ-PARTICIPANT;CN=3Dkernel-janitors@vger.kernel.org:mailto:=
kernel-janitors@vger.kernel.org
BEGIN:VALARM
TRIGGER:-PT10M
ACTION:DISPLAY
DESCRIPTION:Reminder
END:VALARM
END:VEVENT
END:VCALENDAR

--fbc950d0c566def4ca1e134e5d97093ee94bfabb8bf25dfbf833f11cb522--

--798290529bb53624ca7d0797e28ae3aaf9683bb460ffed61761a10cf251a
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64
Content-Type: text/calendar; name="invite.ics"

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vem9vbS51cy8vaUNhbGVuZGFyIEV2ZW50Ly9FTg0K
VkVSU0lPTjoyLjANCkNBTFNDQUxFOkdSRUdPUklBTg0KTUVUSE9EOlJFUVVFU1QNCkJFR0lOOlZU
SU1FWk9ORQ0KVFpJRDpBbWVyaWNhL05ld19Zb3JrDQpMQVNULU1PRElGSUVEOjIwMjYwMzA2VDIz
MTgyOFoNClRaVVJMOmh0dHBzOi8vd3d3LnR6dXJsLm9yZy96b25laW5mby1vdXRsb29rL0FtZXJp
Y2EvTmV3X1lvcmsNClgtTElDLUxPQ0FUSU9OOkFtZXJpY2EvTmV3X1lvcmsNCkJFR0lOOkRBWUxJ
R0hUDQpUWk5BTUU6RURUDQpUWk9GRlNFVEZST006LTA1MDANClRaT0ZGU0VUVE86LTA0MDANCkRU
U1RBUlQ6MTk3MDAzMDhUMDIwMDAwDQpSUlVMRTpGUkVRPVlFQVJMWTtCWU1PTlRIPTM7QllEQVk9
MlNVDQpFTkQ6REFZTElHSFQNCkJFR0lOOlNUQU5EQVJEDQpUWk5BTUU6RVNUDQpUWk9GRlNFVEZS
T006LTA0MDANClRaT0ZGU0VUVE86LTA1MDANCkRUU1RBUlQ6MTk3MDExMDFUMDIwMDAwDQpSUlVM
RTpGUkVRPVlFQVJMWTtCWU1PTlRIPTExO0JZREFZPTFTVQ0KRU5EOlNUQU5EQVJEDQpFTkQ6VlRJ
TUVaT05FDQpCRUdJTjpWRVZFTlQNCkRUU1RBTVA6MjAyNjA0MDVUMTYyMjQ3Wg0KRFRTVEFSVDtU
WklEPUFtZXJpY2EvTmV3X1lvcms6MjAyNjA0MDVUMTUwMDAwDQpEVEVORDtUWklEPUFtZXJpY2Ev
TmV3X1lvcms6MjAyNjA0MDVUMTYwMDAwDQpTVU1NQVJZOkRpc2NvdmVyIEhvdyBUbyBJbnN0YW50
bHkgUmFuayBPbiBUb3AgT2YgRXZlcnkgU2VhcmNoIEZyb20gR29vZ2xlIFJhbmtpbmdzIFRvIEFJ
IERpc2NvdmVyeSBJbiBDaGF0R1BUXCwgR2VtaW5pXCwgQ2xhdWRlXCwgUGVycGxleGl0eVwsICYg
Q29waWxvdA0KVUlEOmI5N2t1ajlvNzBwajBjOWs2c3EzNmUxZ2RkaW40cmo1ZGdtbWtvYmVkNXE2
dXNqajgxcjZlcGJpNXBsbWFzamVjbG0yc3JyaWNzDQpUWklEOkFtZXJpY2EvTmV3X1lvcmsNCkRF
U0NSSVBUSU9OOlRvcGljOiBEaXNjb3ZlciBIb3cgVG8gSW5zdGFudGx5IFJhbmsgT24gVG9wIE9m
IEV2ZXJ5IFNlYXJjaCBGcm9tIEdvb2dsZSBSYW5raW5ncyBUbyBBSSBEaXNjb3ZlcnkgSW4gQ2hh
dEdQVFwsIEdlbWluaVwsIENsYXVkZVwsIFBlcnBsZXhpdHlcLCAmIENvcGlsb3RcbkRlc2NyaXB0
aW9uOiBCT05VUzogR2V0IFRoZSBXb3JsZCdzIEZpcnN0IEFJIEFnZW50IFRoYXQgQnVpbGRzXCwg
UnVucyAmIE1vbmV0aXplcyBBIENvbXBsZXRlIEZhY2VsZXNzIFlvdVR1YmUgQ2hhbm5lbC4gUHJl
c3MgT05FIEJ1dHRvbuKApiBBbmQgV2F0Y2ggQ2hhbm5lbEFnZW50IFJlc2VhcmNoIFlvdXIgTmlj
aGVcLCBXcml0ZSBZb3VyIFNjcmlwdHNcLCBSZWNvcmQgWW91ciBWb2ljZW92ZXJzXCwgQ3JlYXRl
IDEwLTUwIFZpZGVvcyBhdCBnb1wsIERlc2lnbiBZb3VyIFRodW1ibmFpbHNcLCBIYW5kbGUgWW91
ciBTRU9cLCBVcGxvYWQgVG8gWW91VHViZVwsIEFORCBNb25ldGl6ZSBFdmVyeXRoaW5n4oCmIEFs
bCBPbiBDb21wbGV0ZSBBdXRvcGlsb3QuIENsaWNrIGhlcmUgaHR0cHM6Ly9saWsud2lraS9nZXQt
eTB1dHViZS1wYXltZW50c1xuXG5OT1RFOiBJZiB5b3UgZG9uJ3Qgd2FudCBmdXR1cmUgaW52aXRh
dGlvbiB0byBvdXIgc3BlY2lhbCB0cmFpbmluZ3Mga2luZGx5IHNlbmQgYW4gZW1haWwgd2l0aCB0
aGUgc3ViamVjdCAiRU5EJycgdG8gYWRhaDQzMzk3QGdtYWlsLmNvbVxuXG5Kb2luIGZyb20gUENc
LCBNYWNcLCBpUGFkXCwgb3IgQW5kcm9pZDpcbmh0dHBzOi8vdXMwNndlYi56b29tLnVzL3cvODgz
MDE0NzQzODA/dGs9ZVYzNmZ6S2NGbWNTcVU2TUh6Y2cwWjVxcDJmT283LWtucnNlUnFjdXNCZy5E
UWtBQUFBVWp5MlNUQlowTkVzMk1VcFFabE5xVTBRdFEzb3dkVGMzWWxoUkFBQUFBQUFBQUFBQUFB
QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUEmcHdkPXBYV0xjakVQbGk0cW9IanBtRTZOZE1M
UzFJd0lNUS4xJnV1aWQ9V05fWFhfbkw3c0lTT3U4NF9nWk4zYUtMZ1xuUGFzc2NvZGU6NjIwODc0
XG5cblBob25lIG9uZS10YXA6XG4rMTY0NjkzMTM4NjBcLFwsODgzMDE0NzQzODAjXCxcLFwsXCwq
NjIwODc0IyBVU1xuKzE2Njk0NDQ5MTcxXCxcLDg4MzAxNDc0MzgwI1wsXCxcLFwsKjYyMDg3NCMg
VVNcblxuSm9pbiB2aWEgYXVkaW86XG4rMSA2NDYgOTMxIDM4NjAgVVNcbisxIDY2OSA0NDQgOTE3
MSBVU1xuKzEgNjY5IDkwMCA2ODMzIFVTIChTYW4gSm9zZSlcbisxIDY4OSAyNzggMTAwMCBVU1xu
KzEgNzE5IDM1OSA0NTgwIFVTXG4rMSAyNTMgMjA1IDA0NjggVVNcbisxIDI1MyAyMTUgODc4MiBV
UyAoVGFjb21hKVxuKzEgMzAxIDcxNSA4NTkyIFVTIChXYXNoaW5ndG9uIERDKVxuKzEgMzA1IDIy
NCAxOTY4IFVTXG4rMSAzMDkgMjA1IDMzMjUgVVNcbisxIDMxMiA2MjYgNjc5OSBVUyAoQ2hpY2Fn
bylcbisxIDM0NiAyNDggNzc5OSBVUyAoSG91c3RvbilcbisxIDM2MCAyMDkgNTYyMyBVU1xuKzEg
Mzg2IDM0NyA1MDUzIFVTXG4rMSA1MDcgNDczIDQ4NDcgVVNcbisxIDU2NCAyMTcgMjAwMCBVU1xu
KzEgNjQ2IDU1OCA4NjU2IFVTIChOZXcgWW9yaylcbldlYmluYXIgSUQ6IDg4MyAwMTQ3IDQzODBc
blBhc3Njb2RlOiA2MjA4NzRcbkludGVybmF0aW9uYWwgbnVtYmVycyBhdmFpbGFibGU6IGh0dHBz
Oi8vdXMwNndlYi56b29tLnVzL3Uva2Rrd2hCNDZ6YlxuXG5cbg0KTE9DQVRJT046aHR0cHM6Ly91
czA2d2ViLnpvb20udXMvdy84ODMwMTQ3NDM4MD90az1lVjM2ZnpLY0ZtY1NxVTZNSHpjZzBaNXFw
MmZPbzcta25yc2VScWN1c0JnLkRRa0FBQUFVankyU1RCWjBORXMyTVVwUVpsTnFVMFF0UTNvd2RU
YzNZbGhSQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQSZwd2Q9cFhX
TGNqRVBsaTRxb0hqcG1FNk5kTUxTMUl3SU1RLjEmdXVpZD1XTl9YWF9uTDdzSVNPdTg0X2daTjNh
S0xnDQpTRVFVRU5DRToxNzc1NDA1MjA5DQpPUkdBTklaRVI7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7
Q049Wm9vbSBXZWJpbmFyOm5vLXJlcGx5QHpvb20udXMNCkFUVEVOREVFO1JPTEU9UkVRLVBBUlRJ
Q0lQQU5UO0NOPWtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc6bWFpbHRvOmtlcm5lbC1q
YW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmcNCkJFR0lOOlZBTEFSTQ0KVFJJR0dFUjotUFQxME0NCkFD
VElPTjpESVNQTEFZDQpERVNDUklQVElPTjpSZW1pbmRlcg0KRU5EOlZBTEFSTQ0KRU5EOlZFVkVO
VA0KRU5EOlZDQUxFTkRBUg0K
--798290529bb53624ca7d0797e28ae3aaf9683bb460ffed61761a10cf251a--
