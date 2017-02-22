From: "Tobin C. Harding" <me@tobin.cc>
Date: Wed, 22 Feb 2017 00:55:27 +0000
Subject: TODO list errata
Message-Id: <20170222005527.GA4702@eros>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The last task on the TODO list seems to be mixing up definition and declaration

https://kernelnewbies.org/KernelJanitors/Todo

---- from above link
Some function prototypes (in both .h and .c files) specify attributes like __init and __exit in the prototype. gcc (at least at 3.3.3) uses the last such attribute that is actually specified, without issuing a warning. So we can have:

* Prototype declarations that use one attribute and a function body that uses another attribute.

* Functions that from the .c code appear to be normal text but the .h file is silently setting a special attribute.

    Both are potential sources of programmer confusion or bugs.

Identify: * all places where attributes in prototype and function definition don't match (choose the correct one, move it to declaration), * all places where prototype contains attribute but definition doesn't (move it to declaration).

    The same task should not be done for extern data declarations because of FRV.

Once that is done, remove #include <linux/init.h> from all .h files. Only .[cS] files should specify which section the data and text are stored in, .h files should only define the C language information. 
----

Should this be

(choose the correct one, move it to definition)

and

(move it to definition)

As an aside note, is this list of TODO's still current

last edited 2009-04-20 14:59:47 by HenrikKretzschmar


thanks,
Tobin.
