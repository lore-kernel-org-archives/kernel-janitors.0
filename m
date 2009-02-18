From: Manish Katiyar <mkatiyar@gmail.com>
Date: Wed, 18 Feb 2009 15:31:21 +0000
Subject: Re: [PATCH] Replace deprecated __initcall with device_initcall and
Message-Id: <ea11fea30902180719w34e5597ufdeb25bcb183e301@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
In-Reply-To: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Feb 17, 2009 at 6:02 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
>>
>> Hmm.....after doing the changes when I saw the md5sum they are
>> different :-( . Considering that I have done only whitespace fixes,
>> few comments which exceeded 80 cols and replacing __initcall with
>> device_initcall(). The sizes of object files are same.
>> How should I go about finding why is the difference ?
>
> Binary search undoing your changes one-by-one.
>
> My bet is that it is either:
> 1) Move of EXPORT_SYMBOL
> 2) Delete one line where you moved an opening brace
>
> The approch here is simple.
> Split the patch is two parts.
> One that keep the md5 sum, and a second much smaller patch that impact
> the md5 sum. In this way you make it easier to review the changes that
> impact the md5 sum.

Hi Sam,

I am bit confused, apparently it looks like change in comments is
causing md5sum to change. See the output below.

/home/mkatiyar/linux-2.6> md5sum kernel/kallsyms.o
f84966466d48e0b2db0c5e40ff47d0fa  kernel/kallsyms.o
/home/mkatiyar/linux-2.6> git diff
/home/mkatiyar/linux-2.6> vi kernel/kallsyms.c
/home/mkatiyar/linux-2.6> make kernel
  CHK     include/linux/version.h
  CHK     include/linux/utsrelease.h
  UPD     include/linux/utsrelease.h
  SYMLINK include/asm -> include/asm-x86
  CALL    scripts/checksyscalls.sh
  CC      kernel/trace/trace.o
  LD      kernel/trace/built-in.o
  CC      kernel/module.o
  CC      kernel/kallsyms.o
  LD      kernel/built-in.o
/home/mkatiyar/linux-2.6> md5sum kernel/kallsyms.o
18cf3589698b8b00faa635d2d5ffab31  kernel/kallsyms.o
/home/mkatiyar/linux-2.6> git diff
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 7b8b0f2..d045b9c 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -30,7 +30,8 @@
 #define all_var 0
 #endif

-/* These will be re-linked against their real values during the
second link stage */
+/* These will be re-linked against their real values
+ * during the second link stage */
 extern const unsigned long kallsyms_addresses[] __attribute__((weak));
 extern const u8 kallsyms_names[] __attribute__((weak));

Thanks -
Manish


>
>        Sam
>
