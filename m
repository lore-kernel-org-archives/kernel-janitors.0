From: Adrian Bunk <bunk@stusta.de>
Date: Sun, 23 Jan 2005 09:18:49 +0000
Subject: [KJ] Re: 2.6.11-rc2-kj
Message-Id: <20050123091849.GB3196@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53514002124370486=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050122235426.GB22170@nd47.coderock.org>
In-Reply-To: <20050122235426.GB22170@nd47.coderock.org>
To: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>, Nishanth Aravamudan <nacc@us.ibm.com>

--===============53514002124370486==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 23, 2005 at 12:54:26AM +0100, Domen Puncer wrote:
>...
> new in this release:
> --------------------
>...
> wait_event_int_t-drivers_input_joystick_iforce_iforce.h.patch
>   From: Nishanth Aravamudan <nacc@us.ibm.com>
>   Subject: [KJ] [PATCH 13/39] input/iforce-packets: use 	wait_event_interruptible_timeout()
>...

This patch causes two compile errors:

#ifdef CONFIG_JOYSTICK_IFORCE_USB:
- semicolon instead of opening bracket in line 265

#ifdef CONFIG_JOYSTICK_IFORCE_232:
- typo 'wait_event_interrutible_timeout'

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============53514002124370486==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53514002124370486==--
