From: Arjan van de Ven <arjan@infradead.org>
Date: Sun, 19 Apr 2009 14:29:34 +0000
Subject: Re: how to build a vmlinux with debugging symbols?
Message-Id: <20090419072934.592127af@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ef37ea20904190718p2d5164efib231cc9f468854c2@mail.gmail.com>
In-Reply-To: <ef37ea20904190718p2d5164efib231cc9f468854c2@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Task Struct From Hell <taskstructfromhell@googlemail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 19 Apr 2009 15:18:33 +0100
Task Struct From Hell <taskstructfromhell@googlemail.com> wrote:

> List,
> 
> I am trying to figure out why one of my servers crashed, I have some C
> and ASM knowledge and back in the 2.2 days I even wrote a few modules
> to the Linux kernel, but now I am completely lost in the 2.6 kbuild
> and as such, can someone point into some documentation on debugging
> vmcore's and how to enable debugging symbols so using gdb wont be as
> painful? :-)

Hi,

just enable CONFIG_DEBUG_INFO configure option...

(and you can use the sripts/markup_oops.pl script to help decode
oopses.. no need for gdb)


-- 
Arjan van de Ven 	Intel Open Source Technology Centre
For development, discussion and tips for power savings, 
visit http://www.lesswatts.org
