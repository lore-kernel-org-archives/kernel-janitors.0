From: "pradeep singh" <2500.pradeep@gmail.com>
Date: Mon, 14 May 2007 08:03:53 +0000
Subject: [KJ] [RFC]__sock_create() change
Message-Id: <366312910705140051jec8f781oc0c430152b0c48ff@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2937718652044239980=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============2937718652044239980==
Content-Type: multipart/alternative; 
	boundary="----=_Part_144129_16453637.1179129113000"

------=_Part_144129_16453637.1179129113000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi All,

the __sock_create in net/socket.c has the following code snippet.

if (family == PF_INET && type == SOCK_PACKET) {
     static int warned;
     if (!warned) {
          warned = 1;
          printk(KERN_INFO "%s uses obsolete (PF_INET,SOCK_PACKET)\n",
current->comm);
     }
     family = PF_PACKET;
}

this may be in place to emit a harmless warning , but why not change it to -

if (family == PF_INET && type == SOCK_PACKET) {

     printk(KERN_INFO "%s uses obsolete (PF_INET,SOCK_PACKET)\n",
current->comm);

     family = PF_PACKET;
}

Because anyway if(!warning) is going to result in true everytime we enter
the function, as static int warning has scope limited to the outer if block.


Comments?

Thank you
~psr
-- 
play the game

------=_Part_144129_16453637.1179129113000
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi All,<br><br>the __sock_create in net/socket.c has the following code snippet.<br><br>if (family == PF_INET &amp;&amp; type == SOCK_PACKET) {<br>		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;static int warned; <br>		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!warned) {<br>			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;warned = 1;
<br>			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printk(KERN_INFO &quot;%s uses obsolete (PF_INET,SOCK_PACKET)\n&quot;, current-&gt;comm);<br>		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;family = PF_PACKET;<br>	}<br><br>this may be in place to emit a harmless warning , but why not change it to - 
<br>if (family == PF_INET &amp;&amp; type == SOCK_PACKET) {<br>		 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printk(KERN_INFO &quot;%s uses obsolete (PF_INET,SOCK_PACKET)\n&quot;, current-&gt;comm);<br>		<br>		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;family = PF_PACKET;<br>	}<br><br>Because anyway if(!warning) is going to result in true everytime we enter the function, as static int warning has scope limited to the outer if block. 
<br clear="all"><br>Comments? <br><br>Thank you<br>~psr<br>-- <br>play the game 

------=_Part_144129_16453637.1179129113000--

--===============2937718652044239980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--===============2937718652044239980==--
