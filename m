From: Steven Rostedt <rostedt@goodmis.org>
Date: Thu, 15 Oct 2020 15:18:52 +0000
Subject: Re: [PATCH] tools: net: traceevent: Fix 'snprintf' return value check in 'tep_filter_strerror'
Message-Id: <20201015111852.355049b1@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201015142959.GA18281@laptop>
        <d489b145997147fd961050321b17d85d@bfs.de>
In-Reply-To: <d489b145997147fd961050321b17d85d@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter Harms <wharms@bfs.de>
Cc: Fedor Tokarev <ftokarev@gmail.com>, "acme@redhat.com" <acme@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, 15 Oct 2020 15:12:53 +0000
Walter Harms <wharms@bfs.de> wrote:

> i guess the whole thing can be made more simple 
> 
> we have len and buflen
> 
> len=strlen(filter->error_buffer);
> if (len >= buflen )
>   return -1;
> 
> strcpy(buf, filter->error_buffer);
>

Either is fine, but we are moving libtraceevent into it's own library,
which is located here:

  https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/

-- Steve
