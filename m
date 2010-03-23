From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Date: Tue, 23 Mar 2010 02:47:33 +0000
Subject: Re: [patch] kcore: fix test for end of list
Message-Id: <2375c9f91003221947n4d4f417w3a5ea32565e9c582@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100322120509.GC21571@bicker>
	 <20100323091841.dd500a38.kamezawa.hiroyu@jp.fujitsu.com>
In-Reply-To: <20100323091841.dd500a38.kamezawa.hiroyu@jp.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Cc: Dan Carpenter <error27@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Jiri Slaby <jirislaby@gmail.com>, Jaswinder Singh Rajput <jaswinderrajput@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 23, 2010 at 8:18 AM, KAMEZAWA Hiroyuki
<kamezawa.hiroyu@jp.fujitsu.com> wrote:
> On Mon, 22 Mar 2010 15:05:09 +0300
> Dan Carpenter <error27@gmail.com> wrote:
>
>> "m" is never NULL here. =C2=A0We need a different test for the end of li=
st
>> condition.
>>
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> yes, thank you.
> Acked-by: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>

Yeah, this is a good catch for me too!

Acked-by: WANG Cong <xiyou.wangcong@gmail.com>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
