From: Adrian Bunk <bunk@kernel.org>
Date: Mon, 28 Jan 2008 08:34:21 +0000
Subject: Re: #if 0
Message-Id: <20080128083421.GA1001@does.not.exist>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4d8e3fd30801271510kff526e1u98a7f85e3606b8e3@mail.gmail.com>
In-Reply-To: <4d8e3fd30801271510kff526e1u98a7f85e3606b8e3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jan 28, 2008 at 12:10:32AM +0100, Paolo Ciarrocchi wrote:

> Hi all,

Hi Paolo,

> I'm failing to understand why the following patch is changing the md5sum
> of the relative .o file
>...

it should stay the same if you disable CONFIG_DEBUG_INFO in your .config.

> Thanks!
> 
> Ciao,

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

