From: =?koi8-r?Q?=22?=Alexey Dobriyan=?koi8-r?Q?=22=20?=<adobriyan@mail.ru>
Date: Sun, 13 Jun 2004 11:14:16 +0000
Subject: [Kernel-janitors] [PATCH] Fix 'No description found for parameter'
Message-Id: <E1BZSwK-000My8-00.adobriyan-mail-ru@f15.mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38128416511075969=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============38128416511075969==
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 8bit

This patch fixes the following warning

$ make sgmldocs
...
Warning(include/linux/skbuff.h:275): No description found for
parameter 'head,*data,*tail,*end'
...

by adding support for comma-separated members in structs and
unions.

Tested on 'make sgmldocs' and a testcase with pointers,
bitfields and plain variables.

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

--- a/scripts/kernel-doc	2004-05-24 12:57:13.000000000 +0400
+++ b/scripts/kernel-doc	2004-05-24 15:54:46.000000000 +0400
@@ -105,10 +105,7 @@
 # enums and typedefs. Instead of the function name you must write the name 
 # of the declaration;  the struct/union/enum/typedef must always precede 
 # the name. Nesting of declarations is not supported. 
-# Use the argument mechanism to document members or constants. In 
-# structs and unions you must declare one member per declaration 
-# (comma-separated members are not allowed -  the parser does not support 
-# this).
+# Use the argument mechanism to document members or constants.
 # e.g.
 # /**
 #  * struct my_struct - short description
@@ -1318,22 +1315,40 @@
 	    $param = $1;
 	    $type = $arg;
 	    $type =~ s/([^\(]+\(\*)$param/$1/;
+	    push_parameter($param, $type, $file);
 	} else {
 	    # evil magic to get fixed array parameters to work
 	    $arg =~ s/(.+\s+)(.+)\[.*/$1* $2/;
-	    my @args = split('\s', $arg);
-	
-	    $param = pop @args;
-	    if ($param =~ m/^(\*+)(.*)/) {
-	        $param = $2;
-		push @args, $1;
-	    } 
-	    elsif ($param =~ m/(.*?)\s*:\s*(\d+)/) {
-	        $param = $1;
-	        push @args, ":$2";
+
+	    $arg =~ s/\s*:\s*/:/g;
+
+	    my @args = split('\s*,\s*', $arg);
+	    if ($args[0] =~ m/\*/) {
+		$args[0] =~ s/(\*+)\s*/ $1/;
+	    }
+	    my @first_arg = split('\s+', shift @args);
+	    unshift(@args, pop @first_arg);
+	    $type = join " ", @first_arg;
+
+	    foreach $param (@args) {
+		if ($param =~ m/^(\*+)\s*(.*)/) {
+		    push_parameter($2, "$type $1", $file);
+		} 
+		elsif ($param =~ m/(.*?):(\d+)/) {
+		    push_parameter($1, "$type:$2", $file)
+		}
+		else {
+		    push_parameter($param, $type, $file);
+		}
 	    }
-	    $type = join " ", @args;
 	}
+    }
+}
+
+sub push_parameter($$$) {
+	my $param = shift;
+	my $type = shift;
+	my $file = shift;
 
 	if ($type eq "" && $param eq "...")
 	{
@@ -1362,7 +1377,6 @@
 
 	push @parameterlist, $param;
 	$parametertypes{$param} = $type;
-    }
 }
 
 ##


--===============38128416511075969==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38128416511075969==--
