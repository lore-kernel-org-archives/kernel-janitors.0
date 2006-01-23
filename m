From: Ron Gage <ron@rongage.org>
Date: Mon, 23 Jan 2006 00:14:07 +0000
Subject: [KJ] request_region cleanup question
Message-Id: <20060122191407.woomvhufmoxwowoo@webmail.rongage.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello...

Is it acceptable/preferred to evaluate the actual return code from
request_region, or is it acceptable to just follow an error path should the
call to request_region fail?

In other words, which is preferred:
ret=request_region(blah,blah...);
if (ret) { fault path }
      - or -
if (request_region(blah,blah...)) { fault path }

I see it go both ways in the current kernel (2.6.15) and want to know if there
is a preferred way to go here.

Personally, I prefer the first method as this allows you to evaluate the actual
reason for the failure and possibly handle that failure gracefully (e.g.
-EAGAIN).

-- 
Ron Gage
(LPIC1 MCP A+ Net+)
Westland, Michigan

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
