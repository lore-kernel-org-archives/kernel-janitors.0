From: <surya.prabhakar@wipro.com>
Date: Mon, 16 Apr 2007 08:10:28 +0000
Subject: [KJ] Trivial patch2:changing const char foo* to const char foo[] in
Message-Id: <1176710308.15136.16.camel@bluegenie>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1081250726=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--===============1081250726==
Content-Type: multipart/signed; micalg=sha1;
	protocol="application/x-pkcs7-signature";
	boundary="=-4SLgy/MmMJmEF/3IcNEv"
Content-class: urn:content-classes:message


--=-4SLgy/MmMJmEF/3IcNEv
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Files modified=20
fs/binfmt_misc.c
fs/ntfs/attrib.c
fs/ntfs/inode.c
fs/ntfs/mft.c
fs/ntfs/super.c


As suggested by Jeff Garzik,=20
----
>The string form [const] char *foo =3D "blah";
>creates two variables in the final assembly output, a static string,
>and
>a char pointer to the static string. The alternate string form
>[const] char foo[] =3D "blah"; is better because it declares a single
>variable.
------

Cleaned up for the new modifications.=20


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
---

diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
index e6f5799..b9ef210 100644
--- a/fs/binfmt_misc.c
+++ b/fs/binfmt_misc.c
@@ -445,7 +445,7 @@ static void entry_status(Node *e, char *page)
 {
 	char *dp;
 	char *status =3D "disabled";
-	const char * flags =3D "flags: ";
+	const char  flags[] =3D "flags: ";
=20
 	if (test_bit(Enabled, &e->flags))
 		status =3D "enabled";
diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 7659cc1..6f9345d 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -869,7 +869,7 @@ static int ntfs_external_attr_find(const ATTR_TYPE
type,
 	ntfschar *al_name;
 	u32 al_name_len;
 	int err =3D 0;
-	static const char *es =3D " Unmount and run chkdsk.";
+	static const char es[] =3D " Unmount and run chkdsk.";
=20
 	ni =3D ctx->ntfs_ino;
 	base_ni =3D ctx->base_ntfs_ino;
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index f8bf8da..f580025 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -1871,7 +1871,7 @@ int ntfs_read_inode_mount(struct inode *vi)
 	} else /* if (!err) */ {
 		ATTR_LIST_ENTRY *al_entry, *next_al_entry;
 		u8 *al_end;
-		static const char *es =3D "  Not allowed.  $MFT is corrupt.  "
+		static const char es[] =3D "  Not allowed.  $MFT is corrupt.  "
 				"You should run chkdsk.";
=20
 		ntfs_debug("Attribute list attribute found in $MFT.");
@@ -2333,7 +2333,7 @@ int ntfs_show_options(struct seq_file *sf, struct
vfsmount *mnt)
=20
 #ifdef NTFS_RW
=20
-static const char *es =3D "  Leaving inconsistent metadata.  Unmount and
run "
+static const char es[] =3D "  Leaving inconsistent metadata.  Unmount and
run "
 		"chkdsk.";
=20
 /**
@@ -2369,7 +2369,7 @@ int ntfs_truncate(struct inode *vi)
 	ntfs_attr_search_ctx *ctx;
 	MFT_RECORD *m;
 	ATTR_RECORD *a;
-	const char *te =3D "  Leaving file length out of sync with i_size.";
+	const char te[] =3D "  Leaving file length out of sync with i_size.";
 	int err, mp_size, size_change, alloc_change;
 	u32 attr_len;
=20
diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 2ad5c8b..a560bb0 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -409,7 +409,7 @@ void __mark_mft_record_dirty(ntfs_inode *ni)
 	__mark_inode_dirty(VFS_I(base_ni), I_DIRTY_SYNC | I_DIRTY_DATASYNC);
 }
=20
-static const char *ntfs_please_email =3D "Please email "
+static const char ntfs_please_email[] =3D "Please email "
 		"linux-ntfs-dev@lists.sourceforge.net and say that you saw "
 		"this message.  Thank you.";
=20
@@ -1106,7 +1106,7 @@ bool ntfs_may_write_mft_record(ntfs_volume *vol,
const unsigned long mft_no,
 	return true;
 }
=20
-static const char *es =3D "  Leaving inconsistent metadata.  Unmount and
run "
+static const char es[] =3D "  Leaving inconsistent metadata.  Unmount and
run "
 		"chkdsk.";
=20
 /**
diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 1594c90..1fe6ddd 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -647,7 +647,7 @@ not_ntfs:
 static struct buffer_head *read_ntfs_boot_sector(struct super_block
*sb,
 		const int silent)
 {
-	const char *read_err_str =3D "Unable to read %s boot sector.";
+	const char read_err_str[] =3D "Unable to read %s boot sector.";
 	struct buffer_head *bh_primary, *bh_backup;
 	sector_t nr_blocks =3D NTFS_SB(sb)->nr_blocks;
=20
@@ -1756,9 +1756,9 @@ static bool load_system_files(ntfs_volume *vol)
 #ifdef NTFS_RW
 	/* Get mft mirror inode compare the contents of $MFT and $MFTMirr. */
 	if (!load_and_init_mft_mirror(vol) || !check_mft_mirror(vol)) {
-		static const char *es1 =3D "Failed to load $MFTMirr";
-		static const char *es2 =3D "$MFTMirr does not match $MFT";
-		static const char *es3 =3D ".  Run ntfsfix and/or chkdsk.";
+		static const char es1[] =3D "Failed to load $MFTMirr";
+		static const char es2[] =3D "$MFTMirr does not match $MFT";
+		static const char es3[] =3D ".  Run ntfsfix and/or chkdsk.";
=20
 		/* If a read-write mount, convert it to a read-only mount. */
 		if (!(sb->s_flags & MS_RDONLY)) {
@@ -1880,11 +1880,11 @@ get_ctx_vol_failed:
 #ifdef NTFS_RW
 	/* Make sure that no unsupported volume flags are set. */
 	if (vol->vol_flags & VOLUME_MUST_MOUNT_RO_MASK) {
-		static const char *es1a =3D "Volume is dirty";
-		static const char *es1b =3D "Volume has been modified by chkdsk";
-		static const char *es1c =3D "Volume has unsupported flags set";
-		static const char *es2a =3D ".  Run chkdsk and mount in Windows.";
-		static const char *es2b =3D ".  Mount in Windows.";
+		static const char es1a[] =3D "Volume is dirty";
+		static const char es1b[] =3D "Volume has been modified by chkdsk";
+		static const char es1c[] =3D "Volume has unsupported flags set";
+		static const char es2a[] =3D ".  Run chkdsk and mount in Windows.";
+		static const char es2b[] =3D ".  Mount in Windows.";
 		const char *es1, *es2;
=20
 		es2 =3D es2a;
@@ -1926,9 +1926,9 @@ get_ctx_vol_failed:
 	rp =3D NULL;
 	if (!load_and_check_logfile(vol, &rp) ||
 			!ntfs_is_logfile_clean(vol->logfile_ino, rp)) {
-		static const char *es1a =3D "Failed to load $LogFile";
-		static const char *es1b =3D "$LogFile is not clean";
-		static const char *es2 =3D ".  Mount in Windows.";
+		static const char es1a[] =3D "Failed to load $LogFile";
+		static const char es1b[] =3D "$LogFile is not clean";
+		static const char es2[] =3D ".  Mount in Windows.";
 		const char *es1;
=20
 		es1 =3D !vol->logfile_ino ? es1a : es1b;
@@ -1974,10 +1974,10 @@ get_ctx_vol_failed:
 	 */
 	err =3D check_windows_hibernation_status(vol);
 	if (unlikely(err)) {
-		static const char *es1a =3D "Failed to determine if Windows is "
+		static const char es1a[] =3D "Failed to determine if Windows is "
 				"hibernated";
-		static const char *es1b =3D "Windows is hibernated";
-		static const char *es2 =3D ".  Run chkdsk.";
+		static const char es1b[] =3D "Windows is hibernated";
+		static const char es2[] =3D ".  Run chkdsk.";
 		const char *es1;
=20
 		es1 =3D err < 0 ? es1a : es1b;
@@ -2049,8 +2049,8 @@ get_ctx_vol_failed:
 	/* If (still) a read-write mount, empty the logfile. */
 	if (!(sb->s_flags & MS_RDONLY) &&
 			!ntfs_empty_logfile(vol->logfile_ino)) {
-		static const char *es1 =3D "Failed to empty $LogFile";
-		static const char *es2 =3D ".  Mount in Windows.";
+		static const char es1[] =3D "Failed to empty $LogFile";
+		static const char es2[] =3D ".  Mount in Windows.";
=20
 		/* Convert to a read-only mount. */
 		if (!(vol->on_errors & (ON_ERRORS_REMOUNT_RO |
@@ -2089,8 +2089,8 @@ get_ctx_vol_failed:
 #ifdef NTFS_RW
 	/* Find the quota file, load it if present, and set it up. */
 	if (!load_and_init_quota(vol)) {
-		static const char *es1 =3D "Failed to load $Quota";
-		static const char *es2 =3D ".  Run chkdsk.";
+		static const char es1[] =3D "Failed to load $Quota";
+		static const char es2[] =3D ".  Run chkdsk.";
=20
 		/* If a read-write mount, convert it to a read-only mount. */
 		if (!(sb->s_flags & MS_RDONLY)) {
@@ -2113,8 +2113,8 @@ get_ctx_vol_failed:
 	/* If (still) a read-write mount, mark the quotas out of date. */
 	if (!(sb->s_flags & MS_RDONLY) &&
 			!ntfs_mark_quotas_out_of_date(vol)) {
-		static const char *es1 =3D "Failed to mark quotas out of date";
-		static const char *es2 =3D ".  Run chkdsk.";
+		static const char es1[] =3D "Failed to mark quotas out of date";
+		static const char es2[] =3D ".  Run chkdsk.";
=20
 		/* Convert to a read-only mount. */
 		if (!(vol->on_errors & (ON_ERRORS_REMOUNT_RO |
@@ -2133,8 +2133,8 @@ get_ctx_vol_failed:
 	 * it, and set it up.
 	 */
 	if (!load_and_init_usnjrnl(vol)) {
-		static const char *es1 =3D "Failed to load $UsnJrnl";
-		static const char *es2 =3D ".  Run chkdsk.";
+		static const char es1[] =3D "Failed to load $UsnJrnl";
+		static const char es2[] =3D ".  Run chkdsk.";
=20
 		/* If a read-write mount, convert it to a read-only mount. */
 		if (!(sb->s_flags & MS_RDONLY)) {
@@ -2156,9 +2156,9 @@ get_ctx_vol_failed:
 	}
 	/* If (still) a read-write mount, stamp the transaction log. */
 	if (!(sb->s_flags & MS_RDONLY) && !ntfs_stamp_usnjrnl(vol)) {
-		static const char *es1 =3D "Failed to stamp transaction log "
+		static const char []es1 =3D "Failed to stamp transaction log "
 				"($UsnJrnl)";
-		static const char *es2 =3D ".  Run chkdsk.";
+		static const char []es2 =3D ".  Run chkdsk.";
=20
 		/* Convert to a read-only mount. */
 		if (!(vol->on_errors & (ON_ERRORS_REMOUNT_RO |
@@ -2389,13 +2389,13 @@ static void ntfs_put_super(struct super_block
*sb)
 		mutex_unlock(&vol->mft_ino->i_mutex);
 		write_inode_now(vol->mft_ino, 1);
 		if (!list_empty(&sb->s_dirty)) {
-			static const char *_s1 =3D "inodes";
-			static const char *_s2 =3D "";
+			static const char _s1[] =3D "inodes";
+			static const char _s2[] =3D "";
 			s1 =3D _s1;
 			s2 =3D _s2;
 		} else {
-			static const char *_s1 =3D "mft pages";
-			static const char *_s2 =3D "They have been thrown "
+			static const char _s1[] =3D "mft pages";
+			static const char _s2[] =3D "They have been thrown "
 					"away.  ";
 			s1 =3D _s1;
 			s2 =3D _s2;



--=20
surya.
16/04/2007

--=-4SLgy/MmMJmEF/3IcNEv
Content-Type: application/x-pkcs7-signature; name=smime.p7s
Content-Disposition: attachment; filename=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJIzCCAuww
ggJVoAMCAQICEG8zftGmvYfSeKA1FishBukwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA3MDMyMjExNTExNloXDTA4MDMyMTExNTEx
NlowSzEfMB0GA1UEAxMWVGhhd3RlIEZyZWVtYWlsIE1lbWJlcjEoMCYGCSqGSIb3DQEJARYZc3Vy
eWEucHJhYmhha2FyQHdpcHJvLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAN/+
l9Kx40VowHNy1cV5enxc1UE6Dw52tCjR1fyyTrYXdb8Xir04OhwY+++irn6eIMFclcTVAHfTXgWR
rXgBmi1AcFPy2zhDwHOc9f4Kj+KMddJYKe5zSdh8KqRXgAr8MoZ1fBiq/KrKZq9vUzwCW3Q0nJDC
S8c3zG1GPQMmQZCYdoXiuFEmPOYqiNmu3gCJicTs9lgxB6j+5XiGcHrn8KHlHe3kqODpMHfVnxmk
Y/Z1A0NkDfFwbqNj/85zTAusk3ZLqvSRScR0F3AA132aZ1LA0tVG6a1u8Ki5cpQrgFvkF1eFqUiu
DMht+EUkzaW25I8Lbon1YCEko5DARpRhc9ECAwEAAaM2MDQwJAYDVR0RBB0wG4EZc3VyeWEucHJh
Ymhha2FyQHdpcHJvLmNvbTAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4GBAAMG17rbLz6X
A1n8zcIjX8+oGrJIaOo2metS9rZ/muMfvz5tqhrrWGaFxbwjy6czu13wkryXnEHuzQ+P1RYi4MLe
ai6xAXzfjDIbJvUfbhp4gUxtDgJQa+QjS3BDwh55iG2KuBLa3yM6Z1ot4i6J4+rUcMSrlAaDx+e2
yEPbqp8gMIIC7DCCAlWgAwIBAgIQbzN+0aa9h9J4oDUWKyEG6TANBgkqhkiG9w0BAQUFADBiMQsw
CQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UE
AxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwHhcNMDcwMzIyMTE1MTE2WhcN
MDgwMzIxMTE1MTE2WjBLMR8wHQYDVQQDExZUaGF3dGUgRnJlZW1haWwgTWVtYmVyMSgwJgYJKoZI
hvcNAQkBFhlzdXJ5YS5wcmFiaGFrYXJAd2lwcm8uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
MIIBCgKCAQEA3/6X0rHjRWjAc3LVxXl6fFzVQToPDna0KNHV/LJOthd1vxeKvTg6HBj776Kufp4g
wVyVxNUAd9NeBZGteAGaLUBwU/LbOEPAc5z1/gqP4ox10lgp7nNJ2HwqpFeACvwyhnV8GKr8qspm
r29TPAJbdDSckMJLxzfMbUY9AyZBkJh2heK4USY85iqI2a7eAImJxOz2WDEHqP7leIZweufwoeUd
7eSo4Okwd9WfGaRj9nUDQ2QN8XBuo2P/znNMC6yTdkuq9JFJxHQXcADXfZpnUsDS1UbprW7wqLly
lCuAW+QXV4WpSK4MyG34RSTNpbbkjwtuifVgISSjkMBGlGFz0QIDAQABozYwNDAkBgNVHREEHTAb
gRlzdXJ5YS5wcmFiaGFrYXJAd2lwcm8uY29tMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEFBQAD
gYEAAwbXutsvPpcDWfzNwiNfz6gaskho6jaZ61L2tn+a4x+/Pm2qGutYZoXFvCPLpzO7XfCSvJec
Qe7ND4/VFiLgwt5qLrEBfN+MMhsm9R9uGniBTG0OAlBr5CNLcEPCHnmIbYq4EtrfIzpnWi3iLonj
6tRwxKuUBoPH57bIQ9uqnyAwggM/MIICqKADAgECAgENMA0GCSqGSIb3DQEBBQUAMIHRMQswCQYD
VQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xGjAYBgNV
BAoTEVRoYXd0ZSBDb25zdWx0aW5nMSgwJgYDVQQLEx9DZXJ0aWZpY2F0aW9uIFNlcnZpY2VzIERp
dmlzaW9uMSQwIgYDVQQDExtUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgQ0ExKzApBgkqhkiG9w0B
CQEWHHBlcnNvbmFsLWZyZWVtYWlsQHRoYXd0ZS5jb20wHhcNMDMwNzE3MDAwMDAwWhcNMTMwNzE2
MjM1OTU5WjBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkg
THRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwgZ8wDQYJ
KoZIhvcNAQEBBQADgY0AMIGJAoGBAMSmPFVzVftOucqZWh5owHUEcJ3f6f+jHuy9zfVb8hp2vX8M
OmHyv1HOAdTlUAow1wJjWiyJFXCO3cnwK4Vaqj9xVsuvPAsH5/EfkTYkKhPPK9Xzgnc9A74r/rsY
Pge/QIACZNenprufZdHFKlSFD0gEf6e20TxhBEAeZBlyYLf7AgMBAAGjgZQwgZEwEgYDVR0TAQH/
BAgwBgEB/wIBADBDBgNVHR8EPDA6MDigNqA0hjJodHRwOi8vY3JsLnRoYXd0ZS5jb20vVGhhd3Rl
UGVyc29uYWxGcmVlbWFpbENBLmNybDALBgNVHQ8EBAMCAQYwKQYDVR0RBCIwIKQeMBwxGjAYBgNV
BAMTEVByaXZhdGVMYWJlbDItMTM4MA0GCSqGSIb3DQEBBQUAA4GBAEiM0VCD6gsuzA2jZqxnD3+v
rL7CF6FDlpSdf0whuPg2H6otnzYvwPQcUCCTcDz9reFhYsPZOhl+hLGZGwDFGguCdJ4lUJRix9sn
cVcljd2pnDmOjCBPZV+V2vf3h9bGCE6u9uo05RAaWzVNd+NWIXiC3CEZNd4ksdMdRv9dX2VPMYID
EDCCAwwCAQEwdjBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0
eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0ECEG8z
ftGmvYfSeKA1FishBukwCQYFKw4DAhoFAKCCAW8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAc
BgkqhkiG9w0BCQUxDxcNMDcwNDE2MDc1ODIwWjAjBgkqhkiG9w0BCQQxFgQUzKgYQi8aXWmNEWhs
2pWSgi424ZYwgYUGCSsGAQQBgjcQBDF4MHYwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0
ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFp
bCBJc3N1aW5nIENBAhBvM37Rpr2H0nigNRYrIQbpMIGHBgsqhkiG9w0BCRACCzF4oHYwYjELMAkG
A1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMT
I1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhBvM37Rpr2H0nigNRYrIQbpMA0G
CSqGSIb3DQEBAQUABIIBAFgHK+WfAjH2Jg3Do9/1H+6EYHOw/adSgf+0sky3QBxb+CZQDH9aEc86
Nsfkvm8lalyOH5uGa0eXme4aSsLgg651jdpV8lf1Tl6x8vPL9IWY9HlgvNMVr2C8UqK2G/vAs7TK
FAdAGEr+yVWWmsrunkwG37rFmvsV5+SpBWmra03SPftyPZ27Z73JK+i4dmTHWyhpZyJHlV1EHR+W
D/2knRpZFquFuzeW254cJrJS5WqE5Q5pC/XWfa862XJe/hKsbLkjA4uD2ecnFJxMCsw6kwU94w2C
5kgncEQJkIOoexsezeZYg9hKIlBcGQDaNYbj91lVUB+eFWB63G3cLW6Ld1AAAAAAAAA=


--=-4SLgy/MmMJmEF/3IcNEv--

--===============1081250726==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

--===============1081250726==--
