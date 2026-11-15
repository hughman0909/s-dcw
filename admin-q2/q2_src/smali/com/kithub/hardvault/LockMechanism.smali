.class final Lcom/kithub/hardvault/LockMechanism;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static unlock(Ljava/lang/String;)Z
    .locals 6

    .line 1
    new-instance v0, Lcom/kithub/hardvault/b;

    const/4 v1, 0x0

    .line 2
    invoke-direct {v0, v1}, Lcom/kithub/hardvault/b;-><init>(I)V

    .line 3
    new-instance v1, Lcom/kithub/hardvault/b;

    const/4 v2, 0x1

    .line 4
    invoke-direct {v1, v2}, Lcom/kithub/hardvault/b;-><init>(I)V

    .line 5
    new-instance v2, Lcom/kithub/hardvault/b;

    const/4 v3, 0x2

    .line 6
    invoke-direct {v2, v3}, Lcom/kithub/hardvault/b;-><init>(I)V

    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/kithub/hardvault/b;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/4 v3, 0x3

    if-ge v2, v3, :cond_6

    .line 8
    aget-object v3, v0, v2

    .line 9
    iget v3, v3, Lcom/kithub/hardvault/b;->a:I

    packed-switch v3, :pswitch_data_0

    if-eqz p0, :cond_1

    .line 10
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x1b

    if-eq v3, v4, :cond_0

    goto :goto_1

    :cond_0
    const/16 v3, 0x12

    .line 11
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/kithub/hardvault/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "41522cddeee1266710f5dbe5bb4de8c1c593a6de64c98c127aa4598e08934fd4"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_2

    :cond_1
    :goto_1
    const/4 v3, 0x0

    goto :goto_2

    :pswitch_0
    if-eqz p0, :cond_1

    .line 12
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x12

    if-ge v3, v4, :cond_2

    goto :goto_1

    :cond_2
    const/16 v3, 0x9

    .line 13
    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/kithub/hardvault/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "293bb6e63c0349c0092d333398425cbbb760b02c46f9eac7ac48dfdb0226b4ae"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_2

    :pswitch_1
    const/4 v3, 0x0

    if-eqz p0, :cond_4

    .line 14
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x9

    if-ge v4, v5, :cond_3

    goto :goto_2

    .line 15
    :cond_3
    invoke-virtual {p0, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/kithub/hardvault/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "281c50bdbbc91f34cbe8e7519de22f23df0a36b238b1c1e06742cc455d511960"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    :cond_4
    :goto_2
    if-nez v3, :cond_5

    return v1

    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_6
    const/4 p0, 0x1

    return p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
