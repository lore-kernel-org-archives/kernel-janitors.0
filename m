From: Michael Veeck <michael.veeck@gmx.net>
Date: Sun, 04 Jul 2004 14:00:43 +0000
Subject: Re: [Kernel-janitors] min/max macros from kernel.h
Message-Id: <40E95E2E.5030500@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44902665261230235=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040704114015.GA5381@moley.homelinux.net>
In-Reply-To: <20040704114015.GA5381@moley.homelinux.net>
To: kernel-janitors@vger.kernel.org

--===============44902665261230235==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



Clemens Buchacher wrote:
> I've replaced the custom MIN/MAX macros in drivers/ide/ide-timing.h with
> the corresponding min/max macros from kernel.h, as suggested by the TODO
> list.

One advice: Before doing stuff on the todo list, ask on the mailing list 
if anybodys working on it. This could save you some time.

Otherwise the patch looks good to me, but next time also tell against 
which version it is. 2.6.7 I presume?

Greetings,
Veeck

--===============44902665261230235==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44902665261230235==--
