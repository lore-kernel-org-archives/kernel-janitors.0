From: "Luis R. Rodriguez" <mcgrof@gmail.com>
Date: Mon, 21 Feb 2011 04:00:38 +0000
Subject: Re: [patch 1/2] staging: ath6kl: cleanup in SEND_FRAME ioctl
Message-Id: <AANLkTincH2GLv58A4_jpHtks03OGUNqTXx0+eT4TO=_Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110220124832.GA1898@bicker>
In-Reply-To: <20110220124832.GA1898@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sun, Feb 20, 2011 at 7:18 AM, Vipin Mehta <vmehta@atheros.com> wrote:
> On Sun, Feb 20, 2011 at 04:49:08AM -0800, Dan Carpenter wrote:
>> The original code was written in a funny way where every statement was
>> part of else if blocks. =C2=A0I broke them up into separate statements by
>> adding breaks on failure conditions.
>>
>> Signed-off-by: Dan Carpenter <error27@gmail.com>

Can you guys please join IRC? ...
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
