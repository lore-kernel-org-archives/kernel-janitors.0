From: Matthew Wilcox <willy@debian.org>
Date: Tue, 27 Jul 2004 03:08:27 +0000
Subject: Re: [Kernel-janitors] [PATCH] net/e1000_ethtool: replace
Message-Id: <20040727030827.GC6171@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84221370175571963=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040726235824.GJ1897@us.ibm.com>
In-Reply-To: <20040726235824.GJ1897@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============84221370175571963==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 26, 2004 at 04:58:24PM -0700, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. This is one (of
> many) cases where I made a decision about replacing
> 
> set_current_state(TASK_INTERRUPTIBLE);
> schedule_timeout(some_time);
> 
> with
> 
> msleep(jiffies_to_msecs(some_time));
> 
> msleep() is not exactly the same as the previous code, but I only did
> this replacement where I thought long delays were *desired*. If this is
> not the case here, then just disregard this patch. 

>  
> -	set_current_state(TASK_INTERRUPTIBLE);
> -
> -	schedule_timeout(data * HZ);
> +	msleep(data * 1000);
>  	del_timer_sync(&adapter->blink_timer);

No, this needs to be interruptible.


-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============84221370175571963==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84221370175571963==--
