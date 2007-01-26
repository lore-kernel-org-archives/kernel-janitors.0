From: Oleg Verych <olecom@flower.upol.cz>
Date: Fri, 26 Jan 2007 18:24:17 +0000
Subject: [KJ] [rfc] of kbuild-improving-option-checking.patch and
Message-Id: <20070126182417.GB14858@flower.upol.cz>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jan 26, 2007 at 01:14:34PM +0100, Roman Zippel wrote:
> Hi,
> 
> On Thu, 25 Jan 2007, Oleg Verych wrote:
> 
> > > Separate output directories are not supported for external modules.
> > 
> > $(objtree) aka $(KBUILD_OUTPUT) and $(KBUILD_EXTMOD) work for me.
> > 
> > Also, inux-source/Makefile expessly sets this up:
> > ,-*- Makefile -*-
> > |$(filter-out _all,$(MAKECMDGOALS)) _all:
> > |        $(if $(KBUILD_VERBOSE:1=),@)$(MAKE) -C $(KBUILD_OUTPUT) \
> > |        KBUILD_SRC=$(CURDIR) \
> > |        KBUILD_EXTMOD="$(KBUILD_EXTMOD)" -f
> > |$(CURDIR)/Makefile $@
> > `-*-
> > 
> > thus, i think you are wrong, unless proved otherwise.
> 
> Well, to be precise, it's currently not supported. Nobody is opposed to 
> the idea, but I'm not aware of that it has been fully implemented yet.

I don't know, how gentoo or debian is doing their setup (at least
debian's docs are big and unclear.)

As for me, something like this works:
,-*- bash -*-
|linux-src:$ mkdir /tmp/build
|linux-src:$ cp $CONGIGS/current-kernel-config /tmp/build/.config
|linux-src:$ make O=/tmp/build modules_prepare
|linux-src:$ make O=/tmp/build M=/mnt/work/driver
|$
`-*-

> > > So this link may be removed and recreated several times? What happens in 
> > > parallel builds, when multiple tests may run at the same time? You just 
> > > produced random behaviour, what every test will see as null...
> > 
> > 1. Option checking may remove that link, due to behaviour of some
> > versions of the GNU binutils.
> > 
> > 2. Option checking is performed only once, after user interactively
> > runs `make' and `make' parsing and rebuilding all makefiles.
> 
> That's not generally true. Option checking is not restricted to a single 
> Makefile (even though arch Makefiles are the only user right now) and not 
> all Makefiles are parsed at once by a single make instance.

Yes you are right. I've made to many assumtions about `make' and how it
used. Tests showed, that 5-7 series of "*-option" are used.

> Thinking about it, there is another problem. The current approach is quite 
> careful where to put the temporary files, but you don't do the same with 
> the link. This means with external modules you just reintroduced the old 
> problem, it's just not as much visible, because the link is still there 
> most of the time, but not always, so you can't guarantee that the source 
> is readonly, if the tests are run in the current directory and the link 
> might need to be recreated.
> 
> The current approach is quite simple, using a temporary file avoids all 
> possible problems with binutils, the only problem is to find the right 
> output directory. I really don't understand why you try so hard to bring 
> /dev/null into this, especially as you have the same problem with the 
> output directory.

OK, let me propose this thing to Kbuild.include:

-- clean up, beautify, simplify "*-option" functions (after i've
structured them, as you saw, it occured to me, that something may be done
better; and happend that after making changes back and forward ;)

-- removed one bashizm: "echo -n", which may lead to wrong options, if
bash isn't used (in Documentation/Changes bash isn't mentioned)

-- spell, tab fixes

-- IMHO racing, that *can* produce wrong options, may occur, only in case
if link was removed, and in this gap gcc tried to open input file,
thus failing. Originally there were /dev/null files, making them links
(null in the prev. patch) is rece condition. I agree with you.

-- finally i propose $DIR/.$$.null, that is managed by
'checker-shell'. Thus "-Wa,-Z" may be removed.

I'm adding KJ list. Don't know, if i will be welcomed there.

Here's my proposal (unless this will be "a kind of good", i will drop
this effort):


--- linux~2.6.20-rc5/scripts/Kbuild.include~Roman's-fix	2007-01-12 19:54:26.000000000 +0100
+++ linux~2.6.20-rc5/scripts/Kbuild.include	2007-01-26 17:09:59.293879500 +0100
@@ -2,5 +2,5 @@
 # kbuild: Generic definitions
 
-# Convinient variables
+# Convenient constants
 comma   := ,
 squote  := '
@@ -57,38 +57,44 @@
 # See documentation in Documentation/kbuild/makefiles.txt
 
-# output directory for tests below
-TMPOUT := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/)
+# checker-shell
+# Usage: option = $(call checker-shell, $(CC) -o $$OUT, option-ok, otherwise)
+# Exit code chooses option. $$OUT is safe location for needless output.
+define checker-shell
+  $(shell set -e -x; \
+    DIR=$(KBUILD_EXTMOD); \
+    cd $${DIR:-$(objtree)}; \
+    OUT=$$PWD/.$$$$.null; \
+    \
+    ln -s /dev/null $$OUT; \
+    if "$(1)" >/dev/null 2>&1; \
+      then echo "$(1)"; \
+      else echo "$(2)"; \
+    fi; \
+    rm -f $$OUT)
+endef
 
 # as-option
 # Usage: cflags-y += $(call as-option, -Wa$(comma)-isa=foo,)
-
-as-option = $(shell if $(CC) $(CFLAGS) $(1) -Wa,-Z -c -o /dev/null \
-	     -xassembler /dev/null > /dev/null 2>&1; then echo "$(1)"; \
-	     else echo "$(2)"; fi ;)
+as-option = $(call checker-shell, \
+   $(CC) $(CFLAGS) $(1) -c -xassembler -o $$OUT /dev/null, $(1), $(2))
 
 # as-instr
 # Usage: cflags-y += $(call as-instr, instr, option1, option2)
-
-as-instr = $(shell if echo -e "$(1)" | \
-		      $(CC) $(AFLAGS) -c -xassembler - \
-			    -o $(TMPOUT)astest$$$$.out > /dev/null 2>&1; \
-		   then rm $(TMPOUT)astest$$$$.out; echo "$(2)"; \
-		   else echo "$(3)"; fi)
+as-instr = $(call checker-shell, \
+   printf "$(1)" | $(CC) $(AFLAGS) -c -xassembler -o $$OUT -, $(2), $(3))
 
 # cc-option
 # Usage: cflags-y += $(call cc-option, -march=winchip-c6, -march=i586)
-
-cc-option = $(shell if $(CC) $(CFLAGS) $(1) -S -o /dev/null -xc /dev/null \
-             > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
+cc-option = $(call checker, \
+   $(CC) $(CFLAGS) $(if $(3),$(3),$(1)) -S -xc /dev/null -o $$OUT, $(1), $(2))
 
 # cc-option-yn
 # Usage: flag := $(call cc-option-yn, -march=winchip-c6)
-cc-option-yn = $(shell if $(CC) $(CFLAGS) $(1) -S -o /dev/null -xc /dev/null \
-                > /dev/null 2>&1; then echo "y"; else echo "n"; fi;)
+cc-option-yn = $(call cc-option, "y", "n", $(1))
 
 # cc-option-align
 # Prefix align with either -falign or -malign
 cc-option-align = $(subst -functions=0,,\
-	$(call cc-option,-falign-functions=0,-malign-functions=0))
+   $(call cc-option,-falign-functions=0,-malign-functions=0))
 
 # cc-version
@@ -98,13 +104,10 @@
 # cc-ifversion
 # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
-cc-ifversion = $(shell if [ $(call cc-version, $(CC)) $(1) $(2) ]; then \
-                       echo $(3); fi;)
+cc-ifversion = $(shell [ $(call cc-version, $(CC)) $(1) $(2) ] && echo $(3))
 
 # ld-option
 # Usage: ldflags += $(call ld-option, -Wl$(comma)--hash-style=both)
-ld-option = $(shell if $(CC) $(1) -nostdlib -xc /dev/null \
-			     -o $(TMPOUT)ldtest$$$$.out > /dev/null 2>&1; \
-             then rm $(TMPOUT)ldtest$$$$.out; echo "$(1)"; \
-             else echo "$(2)"; fi)
+ld-option = $(call checker-shell, \
+   $(CC) $(1) -nostdlib -xc /dev/null -o $$OUT, $(1), $(2))
 
 ###
@@ -116,4 +119,5 @@
 # Prefix -I with $(srctree) if it is not an absolute path
 addtree = $(if $(filter-out -I/%,$(1)),$(patsubst -I%,-I$(srctree)/%,$(1))) $(1)
+
 # Find all -I options and call addtree
 flags = $(foreach o,$($(1)),$(if $(filter -I%,$(o)),$(call addtree,$(o)),$(o)))
@@ -126,5 +130,5 @@
 
 ###
-# if_changed      - execute command if any prerequisite is newer than 
+# if_changed      - execute command if any prerequisite is newer than
 #                   target, or command line has changed
 # if_changed_dep  - as if_changed, but uses fixdep to reveal dependencies
@@ -154,5 +158,5 @@
 any-prereq = $(filter-out $(PHONY),$?) $(filter-out $(PHONY) $(wildcard $^),$^)
 
-# Execute command if command has changed or prerequisitei(s) are updated
+# Execute command if command has changed or prerequisite(s) are updated
 #
 if_changed = $(if $(strip $(any-prereq) $(arg-check)),                       \
@@ -171,5 +175,5 @@
 
 # Usage: $(call if_changed_rule,foo)
-# will check if $(cmd_foo) changed, or any of the prequisites changed,
+# will check if $(cmd_foo) changed, or any of the prerequisites changed,
 # and if so will execute $(rule_foo)
 if_changed_rule = $(if $(strip $(any-prereq) $(arg-check) ),                 \

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
