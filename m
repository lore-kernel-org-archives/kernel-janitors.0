From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 20 Apr 2004 21:03:04 +0000
Subject: Re: [Kernel-janitors] (no subject)
Message-Id: <20040420140304.49726358.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86626436211265267=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040311044154.9A05E1D71A2@ws3-3.us4.outblaze.com>
In-Reply-To: <20040311044154.9A05E1D71A2@ws3-3.us4.outblaze.com>
To: kernel-janitors@vger.kernel.org

--===============86626436211265267==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 08 Apr 2004 17:03:06 -0400 Don Koch wrote:

| There's an instance in kj.pl (and kj-devel.pl) of a missing
| argument to a call to check_pci_enable_device().  Patch follows.
| 
| -- 
| 
| --- kj.pl~	2004-04-08 15:41:08.000000000 -0400
| +++ kj.pl	2004-04-08 16:48:13.000000000 -0400
| @@ -149,7 +149,7 @@
|  
|  		if ($line=~/pdev-\>resource/) {
|  			print "Make sure pci_enable_device --before-- reading resource\n";
| -			check_pci_enable_device($linenr);
| +			check_pci_enable_device($linenr, $filename);
|  			print "$filename:$linenr:$line\n\n";
|  		}
|  
| --- kj-devel.pl~	2004-04-08 15:41:17.000000000 -0400
| +++ kj-devel.pl	2004-04-08 16:48:56.000000000 -0400
| @@ -146,7 +146,7 @@
|  
|  		if ($line=~/pdev-\>resource/) {
|  			print "Make sure pci_enable_device --before-- reading resource\n";
| -			check_pci_enable_device($linenr);
| +			check_pci_enable_device($linenr, $filename);
|  			print "$filename:$linenr:$line\n\n";
|  		}

Applied, thanks.

If the cron job is working correctly, these scripts and other KJ
files will be copied to the web page interface automatically.
I'll have to check on it to see that it happens, or else.... fix it.

--
~Randy

--===============86626436211265267==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86626436211265267==--
