From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 27 Oct 2017 10:15:54 +0000
Subject: Re: iio/accel/stk8312: Improve unlocking of a mutex in two functions
Message-Id: <c2620449-b80a-f0ef-c0d2-92d0c7fb4906@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ae9d7e7f-541e-ce0c-1d41-6b9793c98f78@users.sourceforge.net>
 <20171026170913.5ff10718@archlinux>
In-Reply-To: <20171026170913.5ff10718@archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> In the second case, the jump backwards just makes the code harder
> to read than it currently is.

Maybe =E2=80=A6

But I proposed an other source code layout for useful reasons.


> There is no firm rule about error handling in one place.

There are some design options available.


> If it leads to more complex flow as here, don't do it.

I would appreciate to clarify such a view a bit more.
How would you like to achieve a complete and efficient
exception handling in shown places?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
