From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 07 Feb 2005 23:35:16 +0000
Subject: Re: [KJ] kj-devel.pl
Message-Id: <4207FB34.7010301@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f0cb4a32050131113478b2ec2b@mail.gmail.com>
In-Reply-To: <f0cb4a32050131113478b2ec2b@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Vicente Feito wrote:
> This is the devel script with some modifications/added features, the details:

You read this part of the TODO list, right?
"NOTE:  scripts/kj.pl was a weekend hack.  Don't take it too seriously."

However, kj.pl _could_ become a great tool if you and others are
willing to spend some time on it.  In some cases it might be better
to make additions to sparse instead, e.g., Linus has recently begun
adding lock/unlock annotation support to sparse so that it can
check for missing lock or unlock calls.


> ----------------------------------------------------------------------------------------
> Added a chunk of code to handle comments, this kind of comments /*...*/ and 
> /*...
> ....
> ... */
> but no // C++ style comments since I think there's no point in doing that.
> 
> Based on the DO's and DONT's

As I think you found out, these are recommendations, not hard rules.

> Drivers shouldn't call panic() directly.
> Checking the use of module_init and module_exit (assuming if it's using one 
> it's using the other)
> Adding the GET_USE_COUNT check, cause now it's 'forbidden' too.
> Checking the required MODULE_AUTHOR,MODULE_DESCRIPTION,SUPPORTED_DEVICE.

MODULE_AUTHOR() is now required?  where is that written?

> Checking the change from MODULE_PARM to module_param(name, type, perm)
> Checking the non-existance of __SMP__ which is non-existant by noChecking the 
> non-existance of __SMP__ which is non-existant by now

Yes, they should all be gone.  I don't find any, but it's inexpensive
to make sure that they don't reappear.

> Warning about the use of racy strtok, and the fact the it should be replaced 
> with strsep.
> Checking that the driver don't use syscalls (meaning, avoiding int 0x80)
> Checking the save_flags/save_flags_cli/restore_flags use that it's now 
> deprecated.
> Warning about the use of proc_register instead of create_proc_read_entry().
> Warning about the use of strlen and sprintf too.
> Telling about the better use of const char foo[] = "bla"; vs const char *foo = 
> "bla"; (asm code)
> 
> ----------------------------------------------------------------------------------------
> 
> What it should be fix:
> ----------------------------------------------------------------------------------------
> What I've been thinking on doing is checking that the sizeof takes pointers as 
> arguments (thinking about that), instead of the types, that way, things can 
> be easy to mantain.

I expect that would produce quite a few false warnings on things like
sizeof(pid_t) (just a quick example).

> And the balance of alloc/free with all types of calls (all of them)
Good.

> And also checking that functions use __init as recommended(this goes from 
> check_init called from the module_init/exit part.
> I've been thinking that transforming the array into an array of arrays it 
> could be easier to handle all the files, including the header files.
> The linenumbers are wrong, the numbers are printed relative to the position in
> the array instead of the position in the file, this can be fixed using array 
> of array (references or something similar)
> ----------------------------------------------------------------------------------------
> 
> I'm not sure if I can keep adding things to this, I would like to know
> if I may or may not do that.

It will take some time and work, but if you are willing, it could be
a very useful tool.  I'll test your second script patch soon.

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
