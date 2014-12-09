From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Date: Tue, 09 Dec 2014 21:04:24 +0000
Subject: Re: List my Staging Drivers
Message-Id: <87ppbsa61z.fsf@nemi.mork.no>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAJyon0tny1BjTUDN3WF=cXAKQ5u6_jHUAfOuW6m7NzLsnxmGvQ@mail.gmail.com>
In-Reply-To: <CAJyon0tny1BjTUDN3WF=cXAKQ5u6_jHUAfOuW6m7NzLsnxmGvQ@mail.gmail.com>
	(Lucas Tanure's message of "Tue, 9 Dec 2014 18:45:59 -0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernelnewbies@lists.kernelnewbies.org

Lucas Tanure <tanure@linux.com> writes:

> How do I list where are the modules that I'm using inside kernel ?

 lsmod

The actual drivers you are using:

 ls -l /sys/bus/*/devices/*/driver

Or look at the output of lsusb, lspci etc.


Bj=C3=B8rn
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
