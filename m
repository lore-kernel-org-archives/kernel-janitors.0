From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Date: Fri, 21 May 2004 10:23:20 +0000
Subject: Re: [Kernel-janitors] [PATCH] yield() replaced
Message-Id: <40ADD898.2070406@conectiva.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84929397787957361=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.SOL.4.31.0405201148160.28451-200000@bodega.cs.umass.edu>
In-Reply-To: <Pine.SOL.4.31.0405201148160.28451-200000@bodega.cs.umass.edu>
To: kernel-janitors@vger.kernel.org

--===============84929397787957361==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Randy.Dunlap wrote:

>On Thu, 20 May 2004 21:47:28 -0300 Gustavo Franco <stratus@acm.org> wrote:
>
>| Brendan Burns wrote:
>| 
>| >Hey folks,
>| >sorry about the last empty message...  I'm still figuring out this whole
>| >"e-mail" thing ;-P
>| >
>| >Attached is a patch that replaces all instances of yield() in the drivers
>| >section of the kernel.   I think my choices of schedule vs
>| >schedule_timeout make sense.  I'd love someone to check them...  Plus
>| >since I don't have all the appropriate hardware (read macintosh adb) it
>| >would be great if they were tested by those who do!
>| >
>| 
>| Hi,
>| 
>| I don't think that it's a search and replace issue and i've already 
>| posted some of these patches
>| (checked by me and by the list). Just check the archives! Some of them 
>| were not processed
>| by Randy, right Randy? But i hope that acme will look into it.
>
>Yes, that's correct.  I also hope that acme will consider them.
>  
>

I will, I'm just a bit busy right now, but this weekend I'll try to read 
all the latest messages and get a patchset out

--===============84929397787957361==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84929397787957361==--
