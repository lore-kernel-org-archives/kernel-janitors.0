From: Bryce Harrington <bryce@osdl.org>
Date: Wed, 20 Sep 2006 19:43:37 +0000
Subject: [KJ] [PATCH] Fix for some typos in Documentation/makefiles.txt
Message-Id: <20060920194337.GD17157@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Kai,

I noticed a few typos while reading makefiles.txt to learn about the
kbuild system.  Attached is a patch against 2.6.18 to fix them.

Bryce

Signed-off-by:  Bryce Harrington <bryce@osdl.org>

--- linux-2.6.18/Documentation/kbuild/makefiles.txt.orig	2006-09-19 20:42:06.000000000 -0700
+++ linux-2.6.18/Documentation/kbuild/makefiles.txt	2006-09-20 12:28:14.000000000 -0700
@@ -387,10 +387,10 @@
 
 --- 3.11 $(CC) support functions
 
-	The kernel may be build with several different versions of
+	The kernel may be built with several different versions of
 	$(CC), each supporting a unique set of features and options.
 	kbuild provide basic support to check for valid options for $(CC).
-	$(CC) is useally the gcc compiler, but other alternatives are
+	$(CC) is usually the gcc compiler, but other alternatives are
 	available.
 
     as-option
@@ -449,8 +449,8 @@
 	and $(cflags-y) will be assigned the values -a32 and -m32.
 
     cc-option-align
-	gcc version >= 3.0 shifted type of options used to speify
-	alignment of functions, loops etc. $(cc-option-align) whrn used
+	gcc version >= 3.0 shifted type of options used to specify
+	alignment of functions, loops etc. $(cc-option-align) when used
 	as prefix to the align options will select the right prefix:
 	gcc < 3.00
 		cc-option-align = -malign
@@ -529,7 +529,7 @@
 	Host programs can be made up based on composite objects.
 	The syntax used to define composite objects for host programs is
 	similar to the syntax used for kernel objects.
-	$(<executeable>-objs) list all objects used to link the final
+	$(<executable>-objs) list all objects used to link the final
 	executable.
 
 	Example:
@@ -648,7 +648,7 @@
 
 --- 4.7 Using hostprogs-$(CONFIG_FOO)
 
-	A typcal pattern in a Kbuild file lok like this:
+	A typical pattern in a Kbuild file looks like this:
 
 	Example:
 		#scripts/Makefile
@@ -680,7 +680,8 @@
 be deleted. Kbuild will assume files to be in same relative directory as the
 Makefile except if an absolute path is specified (path starting with '/').
 
-To delete a directory hirachy use:
+To delete a directory hierarchy use:
+
 	Example:
 		#scripts/package/Makefile
 		clean-dirs := $(objtree)/debian/
@@ -923,7 +924,7 @@
 		#arch/i386/Makefile
 		define archhelp
 		  echo  '* bzImage      - Image (arch/$(ARCH)/boot/bzImage)'
-		endef
+		endif
 
 	When make is executed without arguments, the first goal encountered
 	will be built. In the top level Makefile the first goal present
@@ -1011,9 +1012,9 @@
 			$(call if_changed,ld)
 
 	In this example there are two possible targets, requiring different
-	options to the linker. the linker options are specified using the
+	options to the linker.  The linker options are specified using the
 	LDFLAGS_$@ syntax - one for each potential target.
-	$(targets) are assinged all potential targets, herby kbuild knows
+	$(targets) are assigned all potential targets, thereby kbuild knows
 	the targets and will:
 		1) check for commandline changes
 		2) delete target during make clean
@@ -1067,12 +1068,12 @@
 		#Makefile
 		export CPPFLAGS_vmlinux.lds += -P -C -U$(ARCH)
 		
-	The assigment to $(always) is used to tell kbuild to build the
+	The assignment to $(always) is used to tell kbuild to build the
 	target: vmlinux.lds.
 	The assignment to $(CPPFLAGS_vmlinux.lds) tell kbuild to use the
 	specified options when building the target vmlinux.lds.
 	
-	When building the *.lds target kbuild used the variakles:
+	When building the *.lds target kbuild used the variables:
 	CPPFLAGS	: Set in top-level Makefile
 	EXTRA_CPPFLAGS	: May be set in the kbuild makefile
 	CPPFLAGS_$(@F)  : Target specific flags.
@@ -1176,3 +1177,5 @@
 - Generating offset header files.
 - Add more variables to section 7?
 
+
+
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
