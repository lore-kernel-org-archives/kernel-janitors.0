From: Joe Perches <joe@perches.com>
Date: Mon, 23 Sep 2013 20:17:24 +0000
Subject: Re: checkpatch guide for newbies
Message-Id: <1379967444.3575.56.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130923090100.GE6192@mwanda>
	 <1379959611.3575.40.camel@joe-AO722>
In-Reply-To: <1379959611.3575.40.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2013-09-23 at 11:06 -0700, Joe Perches wrote:
> Maybe I'll submit some auto-neatening script eventually
> and see what you think.

Maybe something like:

From: Joe Perches <joe@perches.com>
Subject: [PATCH] scripts/fix_with_checkpatch.sh: Add a trivial script to fix simple style defects

Add a few whitespace and style corrections to individual files.

Create git commits for those changes too.

Signed-off-by: Joe Perches <joe@perches.com>
---
 scripts/fix_with_checkpatch.sh | 52 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100755 scripts/fix_with_checkpatch.sh

diff --git a/scripts/fix_with_checkpatch.sh b/scripts/fix_with_checkpatch.sh
new file mode 100755
index 0000000..c47b111b
--- /dev/null
+++ b/scripts/fix_with_checkpatch.sh
@@ -0,0 +1,50 @@
+#/bin/sh
+
+whitespace_types="spacing space_before_tab pointer_location"
+changecode_types="c99_comments prefer_packed prefer_aligned avoid_externs parenthesis_alignment"
+
+checkpatch_update ()
+{
+    local file="$1"
+    type="$2"
+
+    ./scripts/checkpatch.pl --file --fix --strict --types=$type $file
+    if [ ! -f $file.EXPERIMENTAL-checkpatch-fixes ] ; then
+	return;
+    fi
+
+    mv $file.EXPERIMENTAL-checkpatch-fixes $file
+
+    git diff --stat -p $file | cat
+
+    obj="$(echo $file|sed 's/\.c$/\.o/')"
+
+    make $obj
+
+    tmpfile=$(mktemp git_commit.XXXXXX)
+    echo "$file: checkpatch neatening for $2" > $tmpfile
+    echo "" >> $tmpfile
+    echo "" >> $tmpfile
+
+    git commit -s -F $tmpfile -e $file
+
+    rm -f $tmpfile
+}
+
+for file in "$@"
+do
+
+    if [ ! -f $file ] ; then 
+	echo "Argument '$file' is not a file"
+	continue
+    fi
+
+    for type in $whitespace_types ; do
+	checkpatch_update $file $type
+    done
+
+    for type in $changecode_types ; do
+	checkpatch_update $file $type
+    done
+
+done
-- 
1.8.1.2.459.gbcd45b4.dirty



