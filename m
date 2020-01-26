From: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 26 Jan 2020 19:23:01 +0000
Subject: Re: [RFC] Simplify flush_workqueue/destroy_workqueue pattern
Message-Id: <alpine.DEB.2.21.2001262016340.2576@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-2016873295-1580066582=:2576"
List-Id: <kernel-janitors.vger.kernel.org>
References: <c610718c-4e98-749b-13a8-c23f57988383@wanadoo.fr>
In-Reply-To: <c610718c-4e98-749b-13a8-c23f57988383@wanadoo.fr>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2016873295-1580066582=:2576
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 26 Jan 2020, Christophe JAILLET wrote:

> Hi,
>
> According to description of 'destroy_workqueue()':
>    "Safely destroy a workqueue. All work currently pending will be done first"
>
> Looking deeper at the code, it turns out that the call chain is:
>        destroy_workqueue
>    --> drain_workqueue
>    --> flush_workqueue
>
> So, calling explicitly 'flush_workqueue()' before 'destroy_workqueue()' looks
> redundant.
>
> Using following coccinelle script spots ~90 occurrences, in ~80 files, which
> can be simplified.
>
> >>>>>>>>>>>>>>>
> @r@
> expression e;
> @@
> -    flush_workqueue(e);
>      destroy_workqueue(e);
> >>>>>>>>>>>>>>>
>
> This is way to much for me because my patch submission process is mainly
> manual.
>
> If you agree with my analysis, think that removing these redundant calls is
> useful and have a much more automated patch submission process than me (or
> just have time :), please feel free to submit patches.

The Coccinelle distriubution contains a program splitpatch (make
splitpatch in the tools subdirectory) that can be used for cutting up
patches and sending them to their various maintainers.  There is a file
tools/README.splitpatch that explains how to use it (although I am not
sure that this README is completely up to date...).

julia
--8323329-2016873295-1580066582=:2576--
