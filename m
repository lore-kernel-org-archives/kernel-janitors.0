From: Andrew Morton <akpm@linux-foundation.org>
Date: Sat, 28 Sep 2019 21:23:56 +0000
Subject: Re: [PATCH] mm, vmpressure: Fix a signedness bug in vmpressure_register_event()
Message-Id: <20190928142356.932cff0ad6c17f4a18edc80f@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925110449.GO3264@mwanda>
In-Reply-To: <20190925110449.GO3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, tglx@linutronix.de, Enrico Weigelt <info@metux.net>, Kate Stewart <kstewart@linuxfoundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 25 Sep 2019 14:04:49 +0300 Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "mode" and "level" variables are enums and in this context GCC will
> treat them as unsigned ints so the error handling is never triggered.
> 
> I also removed the bogus initializer because it isn't required any more
> and it's sort of confusing.
> 

A bit picky of me, but it's an eyesore to assign an int to an enum,
then compare the casted enum to an int then copy the enum back to an
int.

How about doing it this way?  Only copy the int to the enum once we
know it's within range?

--- a/mm/vmpressure.c~mm-vmpressure-fix-a-signedness-bug-in-vmpressure_register_event-fix
+++ a/mm/vmpressure.c
@@ -375,20 +375,18 @@ int vmpressure_register_event(struct mem
 
 	/* Find required level */
 	token = strsep(&spec, ",");
-	level = match_string(vmpressure_str_levels, VMPRESSURE_NUM_LEVELS, token);
-	if ((int)level < 0) {
-		ret = level;
+	ret = match_string(vmpressure_str_levels, VMPRESSURE_NUM_LEVELS, token);
+	if (ret < 0)
 		goto out;
-	}
+	level = ret;
 
 	/* Find optional mode */
 	token = strsep(&spec, ",");
 	if (token) {
-		mode = match_string(vmpressure_str_modes, VMPRESSURE_NUM_MODES, token);
-		if ((int)mode < 0) {
-			ret = mode;
+		ret = match_string(vmpressure_str_modes, VMPRESSURE_NUM_MODES, token);
+		if (ret < 0)
 			goto out;
-		}
+		mode = ret;
 	}
 
 	ev = kzalloc(sizeof(*ev), GFP_KERNEL);
_
