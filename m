From: Felix Oxley <lkml@oxley.org>
Date: Tue, 11 Oct 2005 21:07:07 +0000
Subject: [KJ] Re: Fixing:  char *foo = "blah";
Message-Id: <200510112207.09190.lkml@oxley.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76527243285760171=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============76527243285760171==
Content-Type: multipart/alternative;
    boundary="----------=_1129064973-30962-133"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1129064973-30962-133
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 07 October 2005 12:34, you wrote:

Hi,

I am nearly ready to submit a patch for this.
I have done the code modifications, the test of the basic principle and am currently comparing the size of the kernel (make allyesconfig) before and after the patch.

I will submit the whole lot in 12 hours.

However I have a couple of queries.
First, here are my own answers to the questions I submitted previously to which I received no response :-(
(Ricardo did reply, but didn't answer my questions)

Here is a reminder of the TODO list task:
> > From: Jeff Garzik <jgarzik at mandrakesoft dot com>
> >
> > 1) The string form
> >
> >         [const] char *foo = "blah";
> >
> > creates two variables in the final assembly output, a static string, and
> > a char pointer to the static string.  The alternate string form
> >
> >         [const] char foo[] = "blah";
> >
> > is better because it declares a single variable.
> >
> > For variables marked __initdata, the "*foo" form causes only the
> > pointer, not the string itself, to be dropped from the kernel image,
> > which is a bug.  Using the "foo[]" form with regular 'ole local
> > variables also makes the assembly shorter.

My question were:

> 1. 	I presume that the [brackets] indicate that const is optional.
> 	Therefore the following needs correcting:
> 		char *foo = "blah";
	
	Yes

> 2.	I suppose that the following form would also need correcting:
> 		static const char *foo = "blah"

	Yes
>
> 3.	Does the following (with an empty string) need correcting?
> 		[const] char *foo = "";
>

	Yes (?)

> 4. 	What about this?
> 		static const char *class_name[] = { "off","UBR","CBR","VBR","ABR" };

	No
	
> 5. 	These changes are spread across the kernel code.
> 	Do patches need to be submitted to individual subsystem maintainers, or
> will a single patch be ok?

	** Please answer this one for me. **

====

But I have one more question.
In certain places we have the following code:
(e.g. scripts/pnmtologo.c or arch/ppc/platforms/chrp_setup.c)

static const char *foo = "ABC";

int main(int argc, char *argv[])
{
	foo = "some other value";
}


How can this be allowed? foo has been declared constant and yet is being assigned a new value ??!!

My problem is that if you declare foo[] instead the code does not compile !!!!!!

This has a major effect of the validity of my patch/this fix. :-(

A similar question arises in the case of: const char *foo = "";
There would be no point in declaring a constant empty string so it must be given a new value elsewhere in the code.

I hope somebody can explain this to me.
regards,
Felix







------------=_1129064973-30962-133
Content-Type: text/html;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<html><head><meta DEFANGED_name="qrichtext" content="1" /></head><body DEFANGED_style="font-size:10pt;font-family:Sans Serif">
<p>On Friday 07 October 2005 12:34, you wrote:</p>
<p></p>
<p>Hi,</p>
<p></p>
<p>I am nearly ready to submit a patch for this.</p>
<p>I have done the code modifications, the test of the basic principle and am currently comparing the size of the kernel (make allyesconfig) before and after the patch.</p>
<p></p>
<p>I will submit the whole lot in 12 hours.</p>
<p></p>
<p>However I have a couple of queries.</p>
<p>First, here are my own answers to the questions I submitted previously to which I received no response :-(</p>
<p>(Ricardo did reply, but didn't answer my questions)</p>
<p></p>
<p>Here is a reminder of the <span DEFANGED_style="color:#ff0000">TODO</span> list task:</p>
<p><span DEFANGED_style="color:#007000">&gt; &gt; From: Jeff Garzik &lt;jgarzik at mandrakesoft dot com&gt;</span></p>
<p><span DEFANGED_style="color:#007000">&gt; &gt;</span></p>
<p><span DEFANGED_style="color:#007000">&gt; &gt; 1) The string form</span></p>
<p><span DEFANGED_style="color:#007000">&gt; &gt;</span></p>
<p><span DEFANGED_style="color:#007000">&gt; &gt;         [const] char *foo = &quot;blah&quot;;</span></p>
<p><span DEFANGED_style="color:#007000">&gt; &gt;</span></p>
<p><span DEFANGED_style="color:#007000">&gt; &gt; creates two variables in the final assembly output, a static string, and</span></p>
<p><span DEFANGED_style="color:#007000">&gt; &gt; a char pointer to the static string.  The alternate string form</span></p>
<p><span DEFANGED_style="color:#007000">&gt; &gt;</span></p>
<p><span DEFANGED_style="color:#007000">&gt; &gt;         [const] char foo[] = &quot;blah&quot;;</span></p>
<p><span DEFANGED_style="color:#007000">&gt; &gt;</span></p>
<p><span DEFANGED_style="color:#007000">&gt; &gt; is better because it declares a single variable.</span></p>
<p><span DEFANGED_style="color:#007000">&gt; &gt;</span></p>
<p><span DEFANGED_style="color:#007000">&gt; &gt; For variables marked __initdata, the &quot;*foo&quot; form causes only the</span></p>
<p><span DEFANGED_style="color:#007000">&gt; &gt; pointer, not the string itself, to be dropped from the kernel image,</span></p>
<p><span DEFANGED_style="color:#007000">&gt; &gt; which is a bug.  Using the &quot;foo[]&quot; form with regular 'ole local</span></p>
<p><span DEFANGED_style="color:#007000">&gt; &gt; variables also makes the assembly shorter.</span></p>
<p></p>
<p>My question were:</p>
<p></p>
<p><span DEFANGED_style="color:#008000">&gt; 1. 	I presume that the [brackets] indicate that const is optional.</span></p>
<p><span DEFANGED_style="color:#008000">&gt; 	Therefore the following needs correcting:</span></p>
<p><span DEFANGED_style="color:#008000">&gt; 		char *foo = &quot;blah&quot;;</span></p>
<p>	</p>
<p>	Yes</p>
<p></p>
<p><span DEFANGED_style="color:#008000">&gt; 2.	I suppose that the following form would also need correcting:</span></p>
<p><span DEFANGED_style="color:#008000">&gt; 		static const char *foo = &quot;blah&quot;</span></p>
<p></p>
<p>	Yes</p>
<p><span DEFANGED_style="color:#008000">&gt;</span></p>
<p><span DEFANGED_style="color:#008000">&gt; 3.	Does the following (with an empty string) need correcting?</span></p>
<p><span DEFANGED_style="color:#008000">&gt; 		[const] char *foo = &quot;&quot;;</span></p>
<p><span DEFANGED_style="color:#008000">&gt;</span></p>
<p></p>
<p>	Yes (?)</p>
<p></p>
<p><span DEFANGED_style="color:#008000">&gt; 4. 	What about this?</span></p>
<p><span DEFANGED_style="color:#008000">&gt; 		static const char *class_name[] = { &quot;off&quot;,&quot;UBR&quot;,&quot;CBR&quot;,&quot;VBR&quot;,&quot;ABR&quot; };</span></p>
<p></p>
<p>	No</p>
<p>	</p>
<p><span DEFANGED_style="color:#008000">&gt; 5. 	These changes are spread across the kernel code.</span></p>
<p><span DEFANGED_style="color:#008000">&gt; 	Do patches need to be submitted to individual subsystem maintainers, or</span></p>
<p><span DEFANGED_style="color:#008000">&gt; will a single patch be ok?</span></p>
<p></p>
<p>	** Please answer this one for me. **</p>
<p></p>
<p>====</p>
<p></p>
<p>But I have one more question.</p>
<p>In certain places we have the following code:</p>
<p>(e.g. scripts/<span DEFANGED_style="color:#ff0000">pnmtologo</span>.c or arch/ppc/platforms/chrp_setup.c)</p>
<p></p>
<p>static <span DEFANGED_style="color:#ff0000">const</span> char *<span DEFANGED_style="color:#ff0000">foo</span> = &quot;<span DEFANGED_style="color:#ff0000">ABC</span>&quot;;</p>
<p></p>
<p><span DEFANGED_style="color:#ff0000">int</span> main(<span DEFANGED_style="color:#ff0000">int</span> <span DEFANGED_style="color:#ff0000">argc</span>, char *<span DEFANGED_style="color:#ff0000">argv</span>[])</p>
<p>{</p>
<p>	<span DEFANGED_style="color:#ff0000">foo</span> = &quot;some other value&quot;;</p>
<p>}</p>
<p></p>
<p></p>
<p>How can this be allowed?<span DEFANGED_style="color:#ff0000"> fo</span>o has been declared constant and yet is being assigned a new value ??!!</p>
<p></p>
<p>My problem is that if you declare <span DEFANGED_style="color:#ff0000">foo</span>[] instead the code does not compile !!!!!!</p>
<p></p>
<p>This has a major effect of the validity of my patch/this fix. :-(</p>
<p></p>
<p>A similar question arises in the case of: <span DEFANGED_style="color:#ff0000">const</span> char *<span DEFANGED_style="color:#ff0000">foo</span> = &quot;&quot;;</p>
<p>There would be no point in declaring a constant empty string so it must be given a new value elsewhere in the code.</p>
<p></p>
<p>I hope somebody can explain this to me.</p>
<p>regards,</p>
<p>Felix</p>
<p></p>
<p></p>
<p></p>
<p></p>
<p></p>
<p></p>
<p></p>
</body></html>
------------=_1129064973-30962-133--

--===============76527243285760171==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76527243285760171==--
