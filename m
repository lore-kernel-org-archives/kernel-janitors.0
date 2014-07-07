From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Jul 2014 14:25:09 +0000
Subject: re: component: add support for component match array
Message-Id: <20140707142509.GA16408@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Russell King,

This is a semi-automatic email about new static checker warnings.

The patch 6955b58254c2: "component: add support for component match 
array" from Apr 19, 2014, leads to the following Smatch complaint:

drivers/base/component.c:297 component_master_add_with_match()
	 error: we previously assumed 'match' could be null (see line 293)

drivers/base/component.c
   292	
   293		if (ops->add_components && match)
                                           ^^^^^
Patch adds new check.

   294			return -EINVAL;
   295	
   296		/* Reallocate the match array for its true size */
   297		match = component_match_realloc(dev, match, match->num);
                                                            ^^^^^^^^^^
Patch adds unchecked dereference.

   298		if (IS_ERR(match))
   299			return PTR_ERR(match);

regards,
dan carpenter
