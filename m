From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Date: Wed, 30 Jul 2008 15:04:15 +0000
Subject: Re: [PATCH] fs/fat/dir.c fix resource leak
Message-Id: <87wsj3l8gg.fsf@devron.myhome.or.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1217289813.9367.9.camel@localhost.localdomain>
	<87hca8alz6.fsf@devron.myhome.or.jp>
	<87d4kwalh1.fsf@devron.myhome.or.jp>
	<82faac5b0807300215j6cd9d938t7058080a65ffff74@mail.gmail.com>
In-Reply-To: <82faac5b0807300215j6cd9d938t7058080a65ffff74@mail.gmail.com>
	(Darren Jenkins's message of "Wed, 30 Jul 2008 19:15:46 +1000")
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Darren Jenkins <darrenrjenkins@gmail.com>
Cc: kernel Janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

"Darren Jenkins" <darrenrjenkins@gmail.com> writes:

> bufname is not used anymore ? I'm not sure what you mean? are you
> talking about an external tree ?

http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dblob=
;f=3Dfs/fat/dir.c;h=CD4a0162e10d6dea7507507cf25a13fd93d93f04;hb=3DHEAD#l356

No, about current Linus tree. I meant, bufname is used actually, but
it's not allocated dynamically by __getname().

Thanks.
--=20
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
