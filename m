From: "Ray Lee" <ray-lk@madrabbit.org>
Date: Thu, 11 Dec 2008 00:33:12 +0000
Subject: Re: linux rebooting w/o crash dump
Message-Id: <2c0942db0812101633o614390b0ob26e0d83ab78f0cf@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ef37ea20812101623g52a36179g7924683d492e7fa7@mail.gmail.com>
	 <ef37ea20812101625u38af0b42q6a23246bc3eb803@mail.gmail.com>
In-Reply-To: <ef37ea20812101625u38af0b42q6a23246bc3eb803@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Task Struct From Hell <taskstructfromhell@googlemail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Dec 10, 2008 at 4:25 PM, Task Struct From Hell
<taskstructfromhell@googlemail.com> wrote:
> Is there any way to debug a kernel that shuts down without leaving any
> sign of crash, shutdown demand or anything else?
>
> I am absolutely sure it's not a power issue, as I am running
> multi-boot and it's never shutting down on my other OSes,

That means nothing. Linux could be improperly driving the fans or
processor, and the board may be going into thermal shutdown. It
wouldn't be a hardware problem, but rather the kernel causing one.

> plus, with a
> newer kernel everything works like a charm - even with the flag
> 'noreboot'.

Confused. You mean a newer linux kernel doesn't show the problem?
Please explain?

> I would seriously love to find the root of this problem,
> but I'm feeling slightly hand-tied on it, been seeking for hints and
> trying different configurations for about 2 weeks...
