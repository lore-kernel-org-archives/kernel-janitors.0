From: irwan.djajadi@iname.com
Date: Tue, 25 Oct 2005 04:13:10 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] radio-cadet.c: replace
Message-Id: <20051025041310.GB24164@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17450102208154661=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============17450102208154661==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

radio-cadet.c: replace interruptible_sleep_on() with
wait_event_interruptible(). Also, replaced some spaces with tabs.

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>


diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/media/radio/radio-cadet.c mod/drivers/media/radio/radio-cadet.c
--- 2.6.14-rc5/drivers/media/radio/radio-cadet.c	2005-10-22 00:06:20.000000000 -0500
+++ mod/drivers/media/radio/radio-cadet.c	2005-10-24 23:10:32.000000000 -0500
@@ -339,15 +339,15 @@ static ssize_t cadet_read(struct file *f
 		add_timer(&readtimer);
 	}
 	if(rdsin==rdsout) {
-  	        if (file->f_flags & O_NONBLOCK)
-		        return -EWOULDBLOCK;
-	        interruptible_sleep_on(&read_queue);
+		if (file->f_flags & O_NONBLOCK)
+			return -EWOULDBLOCK;
+		wait_event_interruptible(read_queue, rdsin!=rdsout);
 	}		
 	while( i<count && rdsin!=rdsout)
-	        readbuf[i++]=rdsbuf[rdsout++];
+		readbuf[i++]=rdsbuf[rdsout++];
 
 	if (copy_to_user(data,readbuf,i))
-	        return -EFAULT;
+		return -EFAULT;
 	return i;
 }
 


--===============17450102208154661==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17450102208154661==--
