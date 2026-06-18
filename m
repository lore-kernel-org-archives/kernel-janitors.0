Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AFB392C21;
	Thu, 18 Jun 2026 10:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780192; cv=none; b=EIXpFmM+zvOF2X4aHO61VEHV5/9Itf+z5/Uon9kV2YTiFfPWnYw1AFTAaFBtp8qA3D1jrdJHcGgi+9kGV0WUtl3fWT09NUshiEKS2u2Cp/SStYXXTGWJoQDrCdinO+COBh6fyCOOtKsgS6KGsLzYeJDzaeyNV+t6csqdSNpi3RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780192; c=relaxed/simple;
	bh=iDPBcTMkDVnJmMAH7VaFGAakUdDtLjF7dty4sfgf39w=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=czjtKYifR3q7Kh/ZK3k/8D4Oyi6gQ1k2tnz91rqt+tP/GNGT7l9+qFlgYuH0ovLGLurtyJSyha4WvKACJdCKKOA8RokOpYNr/7gXm5fM3rIkutsQ7qds1yT3B3BT9eMttuf0OcOFwTV7++B3jv+fCakG9u3l8UG/WLFoKGqyIeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=V6HQPFr3; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="V6HQPFr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781780166; x=1782384966; i=markus.elfring@web.de;
	bh=caH0Z95eJKjNvtq3UvAmtZBuy4nvneLZQwmVwBRsbAE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=V6HQPFr3svHd1JE1lOkgTpcZ4beNP4OdZR8GxJYKvfi7fA26elsFPUtBxlU1g1qB
	 2WjPGluTYkXTBVUMizOVnISBfnDGkUD+/Ypx4SxZdzp62mpDfLNYbc33zXCJBEvB1
	 ov7/ei+oabA+UMGiSN5iJsrxtmsErBgLAcwktRDqb/HdyAIWj/DgpE3ham/4DifXV
	 Egy6aBX7AkgzLp2A9sRUZSlo8pI3fiTCvKs4/Zr06x8fXj1RQKI3AyG/wzdQ3uDDz
	 H4oScnPMmlAtngOG5xi2g45e+RroH1nUSkbKXRpIIxvdoeqZ/srrVcj4mTm29Q/lv
	 rZiOKDumW8+UxA5N1Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M9qhD-1wWbeF0xk5-004bcW; Thu, 18
 Jun 2026 12:56:06 +0200
Message-ID: <d709474d-62b0-4f7e-9011-a0f716b35383@web.de>
Date: Thu, 18 Jun 2026 12:56:04 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-sound@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>,
 Jaroslav Kysela <perex@perex.cz>, Kees Cook <kees@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] ALSA: emu10k1: Use common error handling code in
 snd_emu10k1_playback_open()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hE1xXDGxOD9erFMomly1yu5ZMKS7IwP+JKWunyHHpUQteHvEobw
 0kyvMPvB+fJD8WCH1x9iz7Ql4OLsyqZ/4TBSa3qmfsRBTcKxS2kP7CU6zY1Z+2P1Ltqdh/y
 Ns/3EVXbKd59ZKLGYJkqLT5YhIAs1eakdz2hyf0JC88J3WSq+jXMOohKAL7KpH7kDqnUzFh
 fPKmVGktUA3D4nJiXVcRA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jkEWUimAQhg=;xv9anG294c/HKAddmWJclvOWEtP
 oH79Dq+WImrJbluqcfEq/0gWyZSYJQVScKwGWUi1+N+NJFwCgJDERhLnj7eSLZZdUEeqae6Fj
 a7vph8vuoC07yZ3z60G7Uhipkq3fNiGSHuEeBDxAc/f1+1dxAQIRRMR8zjoVnyjKl8R8FXq/j
 TZIqJ7NfVtyQGz0a83GPrxS8ptLDOGe/bWqWPSPbcJV6ugV7yBC8HiCxck0JjGaNLeZ4lYhXx
 IQLBNq3SZsNpwtwr14VmSra5F5MUFjheiAgQ8umNsJmKJo0SI5NbjGw4O9MfZtmwEJPjTUFPP
 0eG8Ue7N0nLHtNXITHXmYSXTO1uJWX+HMJ2PyHjqeGXR4JTQ5BzbAMqM0OxOov1szR56WbJNW
 88R12X6y3hfoodyNvkFVkkOxXh1pTI+Qsm6ndejAohS2TkxO57egJttVbTLtLzV4Yh7fnBKrm
 gVDa5KNzSnLz54eqHi80kynbS87JBuYAruDPAY98diIYwvlk6QEGEHJkO57ZXB5baG+FIIjis
 9xMIABO9rgzvNYrQG9XLU+QysVehc87nJ184khO2CI1pyN/FrtA/w7vMsVCPHIQpUA8oKlyLu
 Yp3dAEilW+bRqv5MOOyU5i2gCLWAGxWtoZBN3/A4O/2YpgXiNUVR5ezzOl18D+caRKF/wl7kb
 b7zeDARN/b5VKZrmkOuYOqFNkEM62xqevrRyG3dCrHVSyUR6qyR8MFigZlD8HzKDC/Rks3TD4
 kv8nSwnZQ4DSBuEHTOzt4386pjLAbbPw1sCXq9GLFvufkyy07Ips4R9A4VuGfHuJiSo/DpyfJ
 S3BOf9HCPOtlYTotjY9zNjPfEjquAcjfhXfYvXzyOTX8TSzN80cl3qPxluoeFf/rm5YHdV5XR
 oEi4vJXANO5OC+zxoAdjEXTJLjNENCHs2MJzrXxW+mjU6ptjC6xr1Sx82Si/NqQ2MKUeY5oJc
 WoMnTYCXtWoG5HYA/Cuyh2dgJE7wJSJk8kADK4TECx9UAla7tXgCP7pPFzPD90Z3N0ba9RwqS
 7KJvAevfVCG/lNCwBQA87Xh96PIzAuLuIb6YYLWlkOyxRTQhcH+MBko2mD+CglYz+kL7wD8ro
 QivIbWuNX1jup1we5SNL74k8ywOQU5XIUkbZN7FVQf/tuKaV4i7S5Jarvi0nhtMhFhXaArPqm
 LcArIS29fG2ypD6ecPTfqCfYFvS/WLI/0tbkTKqxPRMLdrOlCbJMVOZPk5Zod07ivF7uvEjS/
 pUDs0w9gUwbNwrnukDQquJLFwY8dv3AkzzYozpGAcOgkgeSprZ//XICRXubYi1l91BYykjPZL
 fuZbiJdmu0ZNaCx3Fxw98JU65beD/aGrpp0hau9/XaL3NKyn6SK+6tZ6oXm7I0ocJHB6Y4BjY
 ZuiprKEDBkBIfi79jktXE7LOlc7BPHQU8BpmoUFiONDuNmdnxf9FM8tP7iI9j5QPRg2w+cb3p
 qjAgd9PXwR4JlQVec9c8en8Dm42wYcXXRPQnG0RL6nOXb8KBbdFl+FDL7snanjqfsFou2GsaK
 LGtRIvuNS6nusycxYyVd8ZAFXA9xgvvghW7QohgRBDW9vST+DfrLGhXrSyK1TROHW5PE6ZS4c
 gKw+KVIKcRDbc7qk8Qyx1HNMj8Vu+abnUA1sg8jhIqMGsK1U6efOGdeAKuDh3FGO76WmCY9dF
 4zQihYj/906fbgRAWOcK1ATR3ib11zcWYWD5nNMT3td+O4KNWCL2BJ54P9p81AVP+4Ksf9Q5I
 sNA0WuL4z8tnEM4L9p98pGFrQK5pRlHH9ZOYoEtBbAnWI6xBMJ8RK7Ms8p915i1MFpkUO/9h+
 ofGxyR/yJQon+nJHeGZ/ZktIWACP1Gt/KYXvWmzLWpxZ19xMuZcex0oTpj7L+ev8bZXNmA+rV
 ih3ItN8uIQLhruFb/XbNy6u4rgOoljgAM6OW4higriAtUmAMtoo55vhNvXhaCVxoT53aZNT57
 WWl4yCJ4amna68zoMDEVbf64LCZZVkn9lYuKor79ItikpsMtYhuwiiRcQEODwC2XrOQy958Pt
 uJ2I46Qhbef7mAVFSmXAuBwx5qZskB9Y5uOszqrb5b0a2SPiL7+tiiXWRUNZr3DfN2LZa2o5A
 C4yPjysYJtnC0WwS3z5DPJy5/QLOpDbl+FX1pndejvU5h0rcXU26KAct+dHnsBiW12J03AwP+
 AE/448C5UR84yCVIWokYM8JkbVI2R/cF+X3th0xPrNMhg7rGHxxaNWv0kZPybtXA06OrwawtF
 4w2qPNekFCo9X956VE3dmrxaRP/55lWLUJetGuSGWSLBlW5TlKIsHW97Nps0xEDvDjoC3PXT0
 PhDP4564CBknENoYU1YAi4r5E9lyhl8BbmGdgDAdpglzE8QgA+aeK1KJmUu3WC134fVba+aIR
 5Eit6Ovcbww8M+Ema+lT7UGqUblRD3wg/V3nYUj5WIEhBdALxNj3upTSAxYL12g4k1z9Qsbqi
 xsRPgFNLkA4TerXLBoPbILGe4gHFE+nunTHQ3dmosjQ1Dz5ftrY4M0/77+LfDfQQYLH1lAFic
 i1tB4NTafalutzvfuBkOeG6eNV0WZVH7/vxFdWH/rzQWGbu+dqAsBi1NiR9ioEhg23etFCXlw
 AZ96EqO+76ZgkhsSfaQLk46RE9A+vxm54n1ee6HxMQgEoPBJ0WwgCNDF4cYch9P6DVMW1MsvT
 vx7Q6fmuwF+SMRBaUJ8nydzx4sJt2FyjXb1EGe0LEVD/Nu2nb1qu9mZckkSIpgeCI7tXC5ftP
 a4Z9vnnjFQ4wrSOpBzqvrlmQZHj7AKX02PAkg3T5oXxnpT0fn8S0R2GeJQ0UAVp6jDFGyveUG
 KsAvUc1gKecMrp8U2FdLvS2JePXIcg6l5zUjUuMCTzwwtsNkty1CB7BQS/h3RBKkioLl0wRfM
 5kASjWp/WTiEJObrVo4099CVsE95jBiSLOez9m19iaKhX8xzwNDZ5GeiVXG/VhI7+YfBREWhp
 vxLwNBiAiiDj2qEGfd0qiGV/88mj/u0CuqOcfVR8+3xlT+qVFFUpRiwSW6vPTw9YzgLENhbHR
 XwyDIeoFipNSdoOws2nAigngR4mgbjxR5QKZvkMogrR93rflnW0zsIjKfMTUfVO49+UzFM2wp
 lmfl8+ix4MLmU4thiFBzQ+pWSOJ1aJo9pyW33yHKsNQEc/mLkRTR2lqVAJuYskH70ZAT2bLA/
 Zo1uKExSlBmNvi35stXW35wOwRXdxoJXxTl+Sh5SjFBb4yUOQ2+S41lZycu+45v3mPqePc82D
 /sG2xLN+Rrrk07WuRiARpeVFtRZ/ibyeinQvyNAmHDtvTM5YAcTGqEguycOSfLqpCTiXye6pd
 X17zoIEIWrsKBn8kzJQJrZ+cy3jCNMrzU09IcH/xljJArLO3iGUzFx0B2HcPiNYGUBIID1sJp
 k5iUhhZn+iHR7bxH43gH+NgfUTGUHSzPQGGJWq3OmEgJRbbeWq4hmzKMCkCLn7syUigerhCUA
 dJM5a500Fk6hTxNpcrNibk7aicQhZf8ZBrP4OqRG8fWSjBtSiwR5kQP6uWUGAXqaWB+ihDVxg
 V3DuBVi081ixwvjgm8FEwuS6264QnAwqFiinRa58j8NnLeGtQ1y1GJBTkRxUWK/L/RJhN+2z8
 gtm7bbhEFxws0HPOQK3BDbv/O6DdANbPoqF+AdEJujtLSLzoVmd9vSJZQQImE01Kf0H3Lhg5O
 7TY9JDYOhMtrBT0U8UicBomG/ax2lFaiMFLvTCEiSusp55gJdbBeje9SsDrJ2zpesha8NRKPx
 fQDx7b7Ti7HoWIV5PMLZfWWwEs321cgxnuOmMm/V0ekaNhO4kHYxAqheqU3aAXJaDLuLXvIr8
 qIGj92mH0luGqO98BN2Atv0mVaj6iJ0vZRyRkSei3iSZXTyH+vTF9N3iSGYCA5DnQ7r1va08k
 mtDfR8sLzzp3CZwsslpWXwEierY42PtMACoGo3ifPmaCsxSCFjWPNQ21StceKWBPtqsL8o5X5
 cm9xWvGY8Az+JkaV38Gh7Jgcpp02y5tZRlpm+Gxur4x7kJw/hpkS786fEcUsUVTSb4Zt+UrGv
 yTjdpdvSY5N8l5i//B6GZRWS4+icT2skI4KSBQMA7a/vysHqgvRBWGQylKBz/7RXnD3pqHtBU
 NvRV+4epo4wICQ9eN7tZWpSLOW111CfxRc2wJn5ERG0gkIrT+czzSmzHtlI2bwlqOxuP76KcB
 JhkyMlgbhS+njdi/RqXbumjtV3FAMrXD2Il5dZ+IXHuncwkDEdrvXstXC7Lq757vIZMkClNT4
 s89/FKIwrhZyM5TkGSjpd21l9UXW9UvieZjZlrfo2zDyVA3pQUWhqmYLWWj/2dPbN25kPGRqH
 7Bu32iVYipQng08na6gkufhIW6KKQNAoACOvD0DpbpAUCxsZty39mZ378tUMtjWRmXWDmoDVu
 OHLpnx9LUG/sH6/THrO1kEHyv56Kc0DeqSEih06KD2RaI6RZsX6TRT2pwN4sLxLyBj42UMXb6
 VD30vGPbxUPFiZ/+uwkEq+XYQTQhxR8sIAGCcZfIqyph2wmGuSTmloyDcsaFNTS1vlBgZxl5m
 PDmjotmvW5r1X3vu2+yzIuilWSoKZXSskhK4NaiMFApUpnBoutrn4xkOLuL6N57r8TqUoqJBh
 ruDQDGzwkCryl2DQRm3ncaXfkBPinjqbUVEtJcGgCdxdbiasPnOLkZK1JojlswGpMgLMIo//K
 paK6L6oL6H7YkT0zd/6I/qbZ+QrxAQu120Pt9sF4zQ92/bHdxzG+xltdQklJAmGFg1sdFK137
 FW6n2/+GDrubd3gtpfRuGe88YOdl9yGyFH/vbazqSK3hx2En3s/gxason6zwVasDgGQfKvq//
 0XFrd9XcoFsSTBRGbNpPI94hrbqayinyf2csphYGAsGbpFcZGwBiVWuWdqeiweMa0ZMU1dXGP
 7tjbSobdnI9uhtcPJ3cEmhcrPVgRL7GytC0pX2o/zIGeF4pFgRsFKirWyfOjntJOnnyBRFF40
 h7qjYW959hEJyYtojKyIa04KqpwNDu3Kqa4sKVH3PUX0LuOE2+T2we6Nh/vnrkQTMJLSLYCl6
 8G4ogkR5k6S1RM99KrkQSeCyca80+cpVwND1wZAqrLbyev3LM04Q6u4ut7AJ94JeWkMIOcN14
 wNtr1+SyQ/TrN44y5PxxpDc6AcCw1ZOcA1MbHkmHvohH/9i3VVB166yJr7E/mwcLOMKkFECEf
 0m4M3iuuFwC6OsOclhRL2wIQB4kHhFCr+XjEESQlQ5WpGoIKOcWfsPt/bxMJHofYZ9hh/TmkN
 CBLhyMxiox9fThJQ8YMrUB7UBRLZ7xyzY+opJ9/rQnZr5Fv+o/rxpcrVOeM/4eDaioNofkMJj
 imVFwQq8z1wliD7D2guJAaZKn3quw+ujnqNcFk4r63RBG3G0wQnIvxjFkGObTa8Vd5iI5gYYz
 kthIqQ2PcTZ8LkyjXURUrp+hbJXcWMy9ZE30CqqOIANknpq5sennBL2QwiXhpx/lLs87ULb42
 tu4ZvmDY3jq/WxJ1921ZnxupP8OA1f1O8NFk1kg6qrNm7vyHQXMA8wcGYSK61Cd5qyUFjkTDO
 v7aLjFvKQ1fBfUs5ywd8o5iHrmE0SVHKL4pUHkfA0eA+M8ChPJCC+/LXHE1ggBB3uRrZnQ==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jun 2026 12:24:36 +0200

Use an additional label so that a bit of exception handling can be better
reused at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 sound/pci/emu10k1/emupcm.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 9023f3444d20..b8749e0131ad 100644
=2D-- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -1181,19 +1181,17 @@ static int snd_emu10k1_playback_open(struct snd_pc=
m_substream *substream)
 	runtime->private_free =3D snd_emu10k1_pcm_free_substream;
 	runtime->hw =3D snd_emu10k1_playback;
 	err =3D snd_emu10k1_playback_set_constraints(runtime);
-	if (err < 0) {
-		kfree(epcm);
-		return err;
-	}
+	if (err < 0)
+		goto free_epcm;
+
 	if (emu->card_capabilities->emu_model)
 		sample_rate =3D emu->emu1010.word_clock;
 	else
 		sample_rate =3D 48000;
 	err =3D snd_pcm_hw_rule_noresample(runtime, sample_rate);
-	if (err < 0) {
-		kfree(epcm);
-		return err;
-	}
+	if (err < 0)
+		goto free_epcm;
+
 	mix =3D &emu->pcm_mixer[substream->number];
 	for (i =3D 0; i < 8; i++)
 		mix->send_routing[0][i] =3D mix->send_routing[1][i] =3D mix->send_routi=
ng[2][i] =3D i;
@@ -1204,6 +1202,10 @@ static int snd_emu10k1_playback_open(struct snd_pcm=
_substream *substream)
 	mix->epcm =3D epcm;
 	snd_emu10k1_pcm_mixer_notify(emu, substream->number, 1);
 	return 0;
+
+free_epcm:
+	kfree(epcm);
+	return err;
 }
=20
 static int snd_emu10k1_playback_close(struct snd_pcm_substream *substream=
)
=2D-=20
2.54.0

