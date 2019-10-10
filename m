From: Joe Perches <joe@perches.com>
Date: Thu, 10 Oct 2019 14:34:01 +0000
Subject: Re: [PATCH] string.h: Mark 34 functions with __must_check
Message-Id: <9b331c1184aca8a32b9132d29957cd5e8bef1c1d.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de>
         <20191009110943.7ff3a08a@gandalf.local.home>
         <CAKwvOdk3OTaAVmbV9Cu+Dzg8zuojjU6ENZfu4cUPaKS2a58d3w@mail.gmail.com>
         <4d890cae9cbbd873096cb1fadb477cf4632ddb9a.camel@perches.com>
         <CAKwvOdntBXd3OPiCV5adcDjXor886-XnsSxcStAjYBJpuEBrqQ@mail.gmail.com>
         <20191010142733.GT2751@twin.jikos.cz>
In-Reply-To: <20191010142733.GT2751@twin.jikos.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dsterba@suse.cz, Nick Desaulniers <ndesaulniers@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kees Cook <keescook@chromium.org>, LKML <linux-kernel@vger.kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

On Thu, 2019-10-10 at 16:27 +0200, David Sterba wrote:
> On Wed, Oct 09, 2019 at 10:33:45AM -0700, Nick Desaulniers wrote:
> > On Wed, Oct 9, 2019 at 9:38 AM Joe Perches <joe@perches.com> wrote:
> > > I believe __must_check is best placed before the return type as
> > > that makes grep for function return type easier to parse.
> > > 
> > > i.e. prefer
> > >         [static inline] __must_check <type> <function>(<args...>);
> > > over
> > >         [static inline] <type> __must_check <function>(<args...>);
> > > 
> > 
> > + Miguel
> > So I just checked `__cold`, and `__cold` is all over the board in
> > style.  I see it:
> > 1. before anything fs/btrfs/super.c#L101
> > 2. after static before return type (what you recommend) fs/btrfs/super.c#L2318
> > 3. after return type fs/btrfs/inode.c#L9426
> 
> As you can see in the git history, case 1 is from 2015 and the newer
> changes put the attribute between type and name - that's my "current"
> but hopefully final preference.
> 
> > Can we pick a style and enforce it via checkpatch? (It's probably not
> > fun to check for each function attribute in
> > include/linux/compiler_attributes.h).
> 
> Anything that has the return type, attributes and function name on one
> line works for me, but I know that there are other style preferences
> that put function name as the first word on a separate line.  My reasons
> are for better search results, ie.
> 
>   extent_map.c:void __cold extent_map_exit(void)
>   extent_map.h:void __cold extent_map_exit(void);
>   file.c:void __cold btrfs_auto_defrag_exit(void)
>   inode.c:void __cold btrfs_destroy_cachep(void)
>   ordered-data.c:void __cold ordered_data_exit(void)
>   ordered-data.h:void __cold ordered_data_exit(void);
> 
> is better than
> 
>   send.c:__cold
>   super.c:__cold
>   super.c:__cold
>   super.c:__cold
> 
> which I might get to fix eventually.

When your examples have no function arguments, line
length isn't much of an issue. But most functions
take arguments and line length might matter there.

Here's a possible checkpatch test for location of
various __<attributes> that are not particularly
standardized.

---
 scripts/checkpatch.pl | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index cf7543a9d1b2..ed7e6319e061 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -390,6 +390,19 @@ our $Attribute	= qr{
 			____cacheline_internodealigned_in_smp|
 			__weak
 		  }x;
+
+our $PositionalAttribute	= qr{
+			__must_check|
+			__printf|
+			__scanf|
+			__pure|
+			__cold|
+			__hot|
+			__visible|
+			__weak|
+			noinline
+		}x;
+
 our $Modifier;
 our $Inline	= qr{inline|__always_inline|noinline|__inline|__inline__};
 our $Member	= qr{->$Ident|\.$Ident|\[[^]]*\]};
@@ -3773,6 +3786,17 @@ sub process {
 			     "Avoid multiple line dereference - prefer '$ref'\n" . $hereprev);
 		}
 
+# check for declarations like __must_check ($PositionalAttribute) after the type
+		if ($line =~ /\b($Declare)\s+($PositionalAttribute)\b/) {
+			if (WARN("ATTRIBUTE_POSITION",
+				 "Prefer position of attribute '$2' before '$1'\n" . $herecurr) &&
+			    $fix) {
+				$fixed[$fixlinenr] =~ s@\b($Declare)(\s+)($PositionalAttribute)\b@$3$2$1@;
+				# 'static void noinline' becomes 'noinline static void', so fix noinline position if necessary
+				$fixed[$fixlinenr] =~ s@\bnoinline(\s+)static\b@static${1}noinline@;
+			}
+		}
+
 # check for declarations of signed or unsigned without int
 		while ($line =~ m{\b($Declare)\s*(?!char\b|short\b|int\b|long\b)\s*($Ident)?\s*[=,;\[\)\(]}g) {
 			my $type = $1;
