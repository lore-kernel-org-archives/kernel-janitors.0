From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Date: Tue, 22 Sep 2009 14:05:08 +0000
Subject: Re: [PATCH 5/5] arch/um: remove duplicate structure field
Message-Id: <2375c9f90909220705m6767ace3y5b431d1aa26ef945@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0909192149250.27171@ask.diku.dk>
	 <20090921160532.GC3868@hack>
	 <CCABB2CC-E9F7-4153-8B60-85619DE71A13@kernel.crashing.org>
In-Reply-To: <CCABB2CC-E9F7-4153-8B60-85619DE71A13@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Julia Lawall <julia@diku.dk>, jdike@addtoit.com, user-mode-linux-user@lists.sourceforge.net, user-mode-linux-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Sep 22, 2009 at 12:26 AM, Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>> "
>> The initialization shall occur in initializer list order, each
>> initializer provided for a particular subobject overriding any
>> previously listed initializer for the same subobject [...]
>> "
>>
>> I am wondering why gcc doesn't (can't?) complain about this?
>
> Does -Woverride-init (included in -Wextra / -W) not work? =C2=A0If so, pl=
ease
> file a bug report.

Hmm, right, it works, but it seems that Linux kernel doesn't use it.
Maybe we should add it? :-/
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
