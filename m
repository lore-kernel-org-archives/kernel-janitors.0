From: Steve French <smfrench@gmail.com>
Date: Mon, 26 Apr 2010 19:08:48 +0000
Subject: Re: [patch] cifs: change && to ||
Message-Id: <w2h524f69651004261208yc7df0e47hc2cae203e537d579@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100426101006.GQ29093@bicker>
In-Reply-To: <20100426101006.GQ29093@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Apr 26, 2010 at 5:46 AM, Dan Carpenter <error27@gmail.com> wrote:
> On Mon, Apr 26, 2010 at 06:44:01AM -0400, Jeff Layton wrote:
>> On Mon, 26 Apr 2010 12:10:06 +0200
>> Dan Carpenter <error27@gmail.com> wrote:
>>
>> > This is a typo, if pvolume_info were NULL it would oops.
>> >
>> Good catch. I wonder though whether we can just eliminate that check
>> altogether? In any case, this is clearly correct in the short term.
>
> Nah, we can't. =A0If the kmalloc() that allocates *pvolume_info fails it
> would lead to an OOPs.
>
> regards,
> dan carpenter

Merged.


--=20
Thanks,

Steve
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
