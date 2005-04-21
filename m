From: Tomas Telensky <tomas@matfyz.cz>
Date: Thu, 21 Apr 2005 20:57:52 +0000
Subject: Re: [KJ] kerneljanitors.org [was: Re: Fwd: Understand the Linux
Message-Id: <20050421205752.GG18912@artax.karlin.mff.cuni.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============048715851861234949=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050324110511.GN7495@artax.karlin.mff.cuni.cz>
In-Reply-To: <20050324110511.GN7495@artax.karlin.mff.cuni.cz>
To: kernel-janitors@vger.kernel.org

--===============048715851861234949==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi Kernel Janitor,

sorry for responding so late.

> On 24/03/05 12:05 +0100, Tomas Telensky wrote:
> > 
> > 
> > Hi,
> > 
> > > | Pardon?
> > > | What's "The kernel janitor project "?
> > > | I am also a newbie , and willing to know about it.
> > > |
> > > |
> > > 
> > > http://www.kerneljanitors.org/
> > > 
> > > It is a project that goes through the kernel, fixing up unmaintained code and
> > > doing other cleanups and API conversion.
> > > 
> > > Jim
> > 
> > This brief intro should be on the page! http://kerneljanitors.org/ looks very
> > unfriendly - they don't even have one sentence to present what they are doing.
> 
> There's readme, "irc talk" and links to two presentations.

I'm sad of the fact that so many excellent open source/free software
project have so strange presentation. The first question of the newcomer - 
WHAT is it - is often the most difficult to find out there.
http://www.kerneljanitors.org/ is a good example. 

In your Readme we can read where is the todo list, where the bugs are
tracked, whom to send ideas... sorry, but not a word about WHO you are and
WHAT you are doing. I wouldn't look for it in pdf presentations...

Reading such pages I'm feeling little bit like in the underground mafia -
that I'm looking for some secret information :)

> As for brief intro... 
> care enough to make a patch? ;-)

Yes, why not. Could you apply it to the start page?
Or something like that.

	Tomas


--- /BIG/tmp/l.html~	Thu Apr 21 22:10:02 2005
+++ /BIG/tmp/l.html	Thu Apr 21 22:10:19 2005
@@ -23,6 +23,15 @@
 <table class="box">
 <tbody><tr><td class="dark">
   <table class="box" width="100%">
+   <tbody><tr><th class="th"><b>Who are we</b></th></tr>
+   <tr><td>
+	We go through the linux kernel sources, doing code reviews, fixing up unmaintained code and
+	doing other cleanups and API conversion. It is a good start to kernel hacking.
+   </td></tr>
+  </tbody></table>
+  <p></p><p>
+
+  <table class="box" width="100%">
    <tbody><tr><th class="th"><b>Local info:</b></th></tr>
    <tr><td>
    <a href="http://www.kerneljanitors.org/TODO">The current TODO list</a><br>

--===============048715851861234949==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============048715851861234949==--
