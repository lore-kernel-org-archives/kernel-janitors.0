From: Vicente Feito <vicente.feito@gmail.com>
Date: Tue, 08 Feb 2005 07:57:33 +0000
Subject: Re: [KJ] kj-devel.pl
Message-Id: <200502080757.33484.vicente.feito@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31253547816189875=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <f0cb4a32050131113478b2ec2b@mail.gmail.com>
In-Reply-To: <f0cb4a32050131113478b2ec2b@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============31253547816189875==
Content-Type: multipart/alternative;
    boundary="----------=_1107864260-27544-441"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1107864260-27544-441
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-Disposition: inline

Hello.
On Monday 07 February 2005 11:35 pm, you wrote:
> Vicente Feito wrote:
> > This is the devel script with some modifications/added features, the
> > details:
>
> You read this part of the TODO list, right?
> "NOTE:  scripts/kj.pl was a weekend hack.  Don't take it too seriously."
>
> However, kj.pl _could_ become a great tool if you and others are
> willing to spend some time on it.  In some cases it might be better
> to make additions to sparse instead, e.g., Linus has recently begun
> adding lock/unlock annotation support to sparse so that it can
> check for missing lock or unlock calls.

Yes, I have to be honest, I've started adding some things before reading the 
'weekend hack thing', and about 3 hours later I've found that line, so I've 
added 1 more hour of thinking and decided to send it anyway.
I think the good part about this script it's that it can be a lightweight tool
for those who don't want to complicate themselves by using sparse at the
beginning, I think they can just start using this for little things, what do 
you think?

>
> > -------------------------------------------------------------------------
> >--------------- Added a chunk of code to handle comments, this kind of
> > comments /*...*/ and /*...
> > ....
> > ... */
> > but no // C++ style comments since I think there's no point in doing
> > that.
> >
> > Based on the DO's and DONT's
>
> As I think you found out, these are recommendations, not hard rules.
>
> > Drivers shouldn't call panic() directly.
> > Checking the use of module_init and module_exit (assuming if it's using
> > one it's using the other)
> > Adding the GET_USE_COUNT check, cause now it's 'forbidden' too.
> > Checking the required MODULE_AUTHOR,MODULE_DESCRIPTION,SUPPORTED_DEVICE.
>
> MODULE_AUTHOR() is now required?  where is that written?

Section 3.2.1 appears as Module Interface Changes :

        -It is now required to have all module information in you code:
            MODULE_AUTHOR,MODULE_DESCRIPTION,SUPPORTED_DEVICE, PARM_DESC
I'm not checking for MODULE_DESC, I'll should add that one and PARM_DESC.

>
> > Checking the change from MODULE_PARM to module_param(name, type, perm)
> > Checking the non-existance of __SMP__ which is non-existant by noChecking
> > the non-existance of __SMP__ which is non-existant by now
>
> Yes, they should all be gone.  I don't find any, but it's inexpensive
> to make sure that they don't reappear.
>
> > Warning about the use of racy strtok, and the fact the it should be
> > replaced with strsep.
> > Checking that the driver don't use syscalls (meaning, avoiding int 0x80)
> > Checking the save_flags/save_flags_cli/restore_flags use that it's now
> > deprecated.
> > Warning about the use of proc_register instead of
> > create_proc_read_entry(). Warning about the use of strlen and sprintf
> > too.
> > Telling about the better use of const char foo[] = "bla"; vs const char
> > *foo = "bla"; (asm code)
> >
> > -------------------------------------------------------------------------
> >---------------
> >
> > What it should be fix:
> > -------------------------------------------------------------------------
> >--------------- What I've been thinking on doing is checking that the
> > sizeof takes pointers as arguments (thinking about that), instead of the
> > types, that way, things can be easy to mantain.
>
> I expect that would produce quite a few false warnings on things like
> sizeof(pid_t) (just a quick example).

I'll need to think about it more, but there's always a way, the bad part it's 
that sometimes the way involves reading the file twice, of course, not 
literarily the file, but the data.

>
> > And the balance of alloc/free with all types of calls (all of them)
>
> Good.
>
> > And also checking that functions use __init as recommended(this goes from
> > check_init called from the module_init/exit part.
> > I've been thinking that transforming the array into an array of arrays it
> > could be easier to handle all the files, including the header files.
> > The linenumbers are wrong, the numbers are printed relative to the
> > position in the array instead of the position in the file, this can be
> > fixed using array of array (references or something similar)
> > -------------------------------------------------------------------------
> >---------------
> >
> > I'm not sure if I can keep adding things to this, I would like to know
> > if I may or may not do that.
>
> It will take some time and work, but if you are willing, it could be
> a very useful tool.  I'll test your second script patch soon.

The second script it's just the removal of strlen and sprintf checks, I'll be 
adding some more things to this.

Vicente.

------------=_1107864260-27544-441
Content-type: text/html; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-Disposition: inline

<html><head><meta DEFANGED_name="qrichtext" content="1" /></head><body DEFANGED_style="font-size:12pt;font-family:Bitstream Vera Sans">
<p>Hello.</p>
<p>On Monday 07 February 2005 11:35 pm, you wrote:</p>
<p>&gt; Vicente Feito wrote:</p>
<p>&gt; &gt; This is the devel script with some modifications/added features, the</p>
<p>&gt; &gt; details:</p>
<p>&gt;</p>
<p>&gt; You read this part of the TODO list, right?</p>
<p>&gt; &quot;NOTE:  scripts/kj.pl was a weekend hack.  Don't take it too seriously.&quot;</p>
<p>&gt;</p>
<p>&gt; However, kj.pl _could_ become a great tool if you and others are</p>
<p>&gt; willing to spend some time on it.  In some cases it might be better</p>
<p>&gt; to make additions to sparse instead, e.g., Linus has recently begun</p>
<p>&gt; adding lock/unlock annotation support to sparse so that it can</p>
<p>&gt; check for missing lock or unlock calls.</p>
<p></p>
<p>Yes, I have to be honest, I've started adding some things before reading the 'weekend hack thing', and about 3 hours later I've found that line, so I've added 1 more hour of thinking and decided to send it anyway.</p>
<p>I think the good part about this script it's that it can be a lightweight tool</p>
<p>for those who don't want to complicate themselves by using sparse at the</p>
<p>beginning, I think they can just start using this for little things, what do you think?</p>
<p></p>
<p>&gt;</p>
<p>&gt; &gt; -------------------------------------------------------------------------</p>
<p>&gt; &gt;--------------- Added a chunk of code to handle comments, this kind of</p>
<p>&gt; &gt; comments /*...*/ and /*...</p>
<p>&gt; &gt; ....</p>
<p>&gt; &gt; ... */</p>
<p>&gt; &gt; but no // C++ style comments since I think there's no point in doing</p>
<p>&gt; &gt; that.</p>
<p>&gt; &gt;</p>
<p>&gt; &gt; Based on the DO's and DONT's</p>
<p>&gt;</p>
<p>&gt; As I think you found out, these are recommendations, not hard rules.</p>
<p>&gt;</p>
<p>&gt; &gt; Drivers shouldn't call panic() directly.</p>
<p>&gt; &gt; Checking the use of module_init and module_exit (assuming if it's using</p>
<p>&gt; &gt; one it's using the other)</p>
<p>&gt; &gt; Adding the GET_USE_COUNT check, cause now it's 'forbidden' too.</p>
<p>&gt; &gt; Checking the required MODULE_AUTHOR,MODULE_DESCRIPTION,SUPPORTED_DEVICE.</p>
<p>&gt;</p>
<p>&gt; MODULE_AUTHOR() is now required?  where is that written?</p>
<p></p>
<p>Section 3.2.1 appears as Module Interface Changes :</p>
<p></p>
<p><span DEFANGED_style="font-style:italic">        -It is now required to have all module information in you code:</span></p>
<p><span DEFANGED_style="font-style:italic">            MODULE_AUTHOR,MODULE_DESCRIPTION,SUPPORTED_DEVICE, PARM_DESC</span></p>
<p>I'm not checking for MODULE_DESC, I'll should add that one and PARM_DESC.</p>
<p></p>
<p>&gt;</p>
<p>&gt; &gt; Checking the change from MODULE_PARM to module_param(name, type, perm)</p>
<p>&gt; &gt; Checking the non-existance of __SMP__ which is non-existant by noChecking</p>
<p>&gt; &gt; the non-existance of __SMP__ which is non-existant by now</p>
<p>&gt;</p>
<p>&gt; Yes, they should all be gone.  I don't find any, but it's inexpensive</p>
<p>&gt; to make sure that they don't reappear.</p>
<p>&gt;</p>
<p>&gt; &gt; Warning about the use of racy strtok, and the fact the it should be</p>
<p>&gt; &gt; replaced with strsep.</p>
<p>&gt; &gt; Checking that the driver don't use syscalls (meaning, avoiding int 0x80)</p>
<p>&gt; &gt; Checking the save_flags/save_flags_cli/restore_flags use that it's now</p>
<p>&gt; &gt; deprecated.</p>
<p>&gt; &gt; Warning about the use of proc_register instead of</p>
<p>&gt; &gt; create_proc_read_entry(). Warning about the use of strlen and sprintf</p>
<p>&gt; &gt; too.</p>
<p>&gt; &gt; Telling about the better use of const char foo[] = &quot;bla&quot;; vs const char</p>
<p>&gt; &gt; *foo = &quot;bla&quot;; (asm code)</p>
<p>&gt; &gt;</p>
<p>&gt; &gt; -------------------------------------------------------------------------</p>
<p>&gt; &gt;---------------</p>
<p>&gt; &gt;</p>
<p>&gt; &gt; What it should be fix:</p>
<p>&gt; &gt; -------------------------------------------------------------------------</p>
<p>&gt; &gt;--------------- What I've been thinking on doing is checking that the</p>
<p>&gt; &gt; sizeof takes pointers as arguments (thinking about that), instead of the</p>
<p>&gt; &gt; types, that way, things can be easy to mantain.</p>
<p>&gt;</p>
<p>&gt; I expect that would produce quite a few false warnings on things like</p>
<p>&gt; sizeof(pid_t) (just a quick example).</p>
<p></p>
<p>I'll need to think about it more, but there's always a way, the bad part it's that sometimes the way involves reading the file twice, of course, not literarily the file, but the data.</p>
<p></p>
<p>&gt;</p>
<p>&gt; &gt; And the balance of alloc/free with all types of calls (all of them)</p>
<p>&gt;</p>
<p>&gt; Good.</p>
<p>&gt;</p>
<p>&gt; &gt; And also checking that functions use __init as recommended(this goes from</p>
<p>&gt; &gt; check_init called from the module_init/exit part.</p>
<p>&gt; &gt; I've been thinking that transforming the array into an array of arrays it</p>
<p>&gt; &gt; could be easier to handle all the files, including the header files.</p>
<p>&gt; &gt; The linenumbers are wrong, the numbers are printed relative to the</p>
<p>&gt; &gt; position in the array instead of the position in the file, this can be</p>
<p>&gt; &gt; fixed using array of array (references or something similar)</p>
<p>&gt; &gt; -------------------------------------------------------------------------</p>
<p>&gt; &gt;---------------</p>
<p>&gt; &gt;</p>
<p>&gt; &gt; I'm not sure if I can keep adding things to this, I would like to know</p>
<p>&gt; &gt; if I may or may not do that.</p>
<p>&gt;</p>
<p>&gt; It will take some time and work, but if you are willing, it could be</p>
<p>&gt; a very useful tool.  I'll test your second script patch soon.</p>
<p></p>
<p>The second script it's just the removal of strlen and sprintf checks, I'll be adding some more things to this.</p>
<p></p>
<p>Vicente.</p>
</body></html>

------------=_1107864260-27544-441--

--===============31253547816189875==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31253547816189875==--
