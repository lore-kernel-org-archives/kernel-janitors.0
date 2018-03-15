From: =?iso-8859-1?Q?Patrick_Br=FCnn?= <P.Bruenn@beckhoff.com>
Date: Thu, 15 Mar 2018 11:12:04 +0000
Subject: RE: [PATCH] rtc: mxc_v2: unlock on error in mxc_rtc_set_alarm()
Message-Id: <3BB206AB2B1BD448954845CE6FF69A8E01F81FD198@nt-mail04>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180314073719.GA2470@mwanda>
In-Reply-To: <20180314073719.GA2470@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

>From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
>Sent: Mittwoch, 14. M=E4rz 2018 08:37
>
>We need to unlock if time is more than U32_MAX.
>
you are right, that's a bug.
But I would move the mxc_rtc_lock() entirely behind the (time > U32_MAX) ch=
eck. IMHO that would make the code even cleaner. sorry for broken patch:

>       const time64_t time =3D rtc_tm_to_time64(&alrm->time);
>       struct mxc_rtc_data *pdata =3D dev_get_drvdata(dev);
>-      int ret =3D mxc_rtc_lock(pdata);
>+      int ret;
>-
>-      if (ret)
>-              return ret;
>
>       if (time > U32_MAX) {
>               dev_err(dev, "Hopefully I am out of service by then :-(\n");
>               return -EINVAL;
>       }
>+
>+      ret =3D mxc_rtc_lock(pdata);
>+      if (ret)
>+              return ret;

---
Beckhoff Automation GmbH & Co. KG | Managing Director: Dipl. Phys. Hans Bec=
khoff
Registered office: Verl, Germany | Register court: Guetersloh HRA 7075



--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
