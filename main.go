package main

import (
	// this package will fail
	// _ "github.com/cpuguy83/go-md2man/v2"

	// these 2 work fine
	_ "github.com/spf13/viper"
	"go.uber.org/zap"
)

func main() {
	z, _ := zap.NewDevelopment()
	defer z.Sync()
	sugar := z.Sugar()

	sugar.Info("hello world!")
}
